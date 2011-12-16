class AddAccountCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_code, :string
  end
end
