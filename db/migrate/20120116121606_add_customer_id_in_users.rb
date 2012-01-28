class AddCustomerIdInUsers < ActiveRecord::Migration
  def up
    add_column :users, :customer_id, :integer
  end

  def down
    remove_column :users, :customer_id
  end
end
