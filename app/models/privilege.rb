class Privilege < ActiveRecord::Base

  validates :name, :presence => {:message => ' must be selected!'}

  has_many :privilege_user
  has_many :users , :through => :privilege_user

end
