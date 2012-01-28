class AddColumnsInExtensions < ActiveRecord::Migration


  def up
    add_column :extensions, :valid_from, :date
    add_column :extensions, :valid_to, :date
  end



  def down
    remove_column :extensions, :valid_from
    remove_column :extensions, :valid_to
  end

  
end
