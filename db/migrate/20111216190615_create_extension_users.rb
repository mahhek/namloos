class CreateExtensionUsers < ActiveRecord::Migration
  def change
    create_table :extension_users do |t|
      t.integer :user_id
      t.integer :extension_id

      t.timestamps
    end
  end
end
