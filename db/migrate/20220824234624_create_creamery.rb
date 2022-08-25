class CreateCreamery < ActiveRecord::Migration[5.2]
  def change
    create_table :creameries do |t|
      t.string :name
      t.integer :date_founded
      t.string :owner
      t.string :head_cheesemaker
      t.string :location
      t.boolean :farmstead
      t.integer :acreage
      t.string :awards_won
    end
  end
end
