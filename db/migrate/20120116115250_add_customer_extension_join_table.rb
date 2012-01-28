class AddCustomerExtensionJoinTable < ActiveRecord::Migration
  def up
    create_table :customers_extensions, :id => false do |t|
      t.integer :customer_id
      t.integer :extension_id
      t.timestamps
    end
  end

  def down
    drop_table :customers_extensions
  end
end
