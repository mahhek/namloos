class Extension < ActiveRecord::Base
  has_many :extension_user
  has_many :users , :through=>:extension_user
end
