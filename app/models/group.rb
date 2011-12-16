class Group < ActiveRecord::Base

  has_many :group_user
  has_many :users , :through=>:group_user
end
