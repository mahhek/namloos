class CreateApplyTos < ActiveRecord::Migration
  def change
    create_table :apply_tos do |t|
      t.string :name

      t.timestamps
    end
  end
end
