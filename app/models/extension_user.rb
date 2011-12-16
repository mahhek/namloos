class ExtensionUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :extension
end
