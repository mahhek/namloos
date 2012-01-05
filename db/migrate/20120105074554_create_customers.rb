class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :company
      t.string :first_name
      t.string :last_name
      t.string :attn
      t.string :sending_method
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :country
      t.string :email
      t.string :phone
      t.string :client_number
      t.string :tax_number
      t.string :coc
      t.string :bank_account
      t.string :extensions
      t.string :account_code
      t.integer :rate_class

      t.timestamps
    end
  end
end
