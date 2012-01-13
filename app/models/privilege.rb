class Privilege < ActiveRecord::Base

  validates :name, :presence => {:message => ' must be selected!'}
  validates :name, :uniqueness => {:message => ' already exists'}

  has_many :privilege_user
  has_many :users , :through => :privilege_user

  has_many :group_privilege
  has_many :groups , :through => :group_privilege

end
