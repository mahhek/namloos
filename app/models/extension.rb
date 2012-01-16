class Extension < ActiveRecord::Base

  validates :name, :presence => {:message => ' must be selected!'}
  validates :name, :uniqueness => {:message => ' already exists'}

  has_many :extension_user
  has_many :users , :through=>:extension_user

end
