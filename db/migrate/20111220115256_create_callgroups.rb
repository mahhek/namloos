class CreateCallgroups < ActiveRecord::Migration
  def change
    create_table :callgroups do |t|
      t.string :name

      t.timestamps
    end
  end
end
