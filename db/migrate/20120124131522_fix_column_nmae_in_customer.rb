class FixColumnNmaeInCustomer < ActiveRecord::Migration

  def self.up
    rename_column :customers, :rate_class, :apply_to_id
  end

 

  def self.down
    rename_column :customers, :apply_to_id, :rate_class
  end
end