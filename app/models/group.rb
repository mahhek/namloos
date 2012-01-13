class Group < ActiveRecord::Base

  validates :name, :presence => {:message => ' must be selected!'}
  validates :name, :uniqueness => {:message => ' already exists'}

  has_many :group_user
  has_many :users , :through=>:group_user
  
  has_many :group_privilege
  has_many :privileges , :through => :group_privilege
end
