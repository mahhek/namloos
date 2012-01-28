class CreateCallDefinations < ActiveRecord::Migration
  def change
    create_table :call_definations do |t|
      t.string :name

      t.timestamps
    end
  end
end
