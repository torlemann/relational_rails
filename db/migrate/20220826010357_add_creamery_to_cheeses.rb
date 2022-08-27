class AddCreameryToCheeses < ActiveRecord::Migration[5.2]
  def change
    add_reference :cheeses, :creamery, foreign_key: true
  end
end
