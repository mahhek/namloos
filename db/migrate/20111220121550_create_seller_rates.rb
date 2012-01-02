class CreateSellerRates < ActiveRecord::Migration
  def change
    create_table :seller_rates do |t|
      t.integer :country_id
      t.integer :apply_to_id
      t.integer :region_id
      t.string  :prefix
      t.string :callgroup
      t.string :start_rate, :default => "0"
      t.integer :call_defination_id
      t.string :rate_per_minute, :default => "1"
      t.string :end_rate, :default => "0"
      t.string :call_per_second, :default => "1"

      t.timestamps
    end
  end
end
