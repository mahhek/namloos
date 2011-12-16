class PrivilegeUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :privilege
end
