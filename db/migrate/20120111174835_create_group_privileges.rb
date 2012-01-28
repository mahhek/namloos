class CreateGroupPrivileges < ActiveRecord::Migration
  def change
    create_table :group_privileges do |t|
      t.integer :group_id
      t.integer :privilege_id

      t.timestamps
    end
  end
end
