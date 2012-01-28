class GroupPrivilege < ActiveRecord::Base
  belongs_to :user
  belongs_to :privilege

end
