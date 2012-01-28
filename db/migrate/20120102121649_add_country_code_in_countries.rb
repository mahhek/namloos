class AddCountryCodeInCountries < ActiveRecord::Migration
  def up
    add_column :countries, :code, :string
    add_column :countries, :region_id, :integer
  end

  def down
    remove_column :countries, :code
    remove_column :countries, :region_id
  end
end
