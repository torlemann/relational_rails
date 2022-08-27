class CreateCheeses < ActiveRecord::Migration[5.2]
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :style
      t.float :net_wt
      t.string :milk_type
      t.boolean :veg_rennet
      t.boolean :raw

      t.timestamps
    end
  end
end
