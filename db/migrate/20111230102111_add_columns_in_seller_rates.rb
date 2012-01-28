class AddColumnsInSellerRates < ActiveRecord::Migration
  
  def up
    add_column :seller_rates, :valid_from, :date
    add_column :seller_rates, :valid_to, :date
  end

  def down
    remove_column :seller_rates, :valid_from
    remove_column :seller_rates, :valid_to
  end
end
