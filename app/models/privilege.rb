class Privilege < ActiveRecord::Base
  has_many :privilege_user
  has_many :users , :through => :privilege_user
end
