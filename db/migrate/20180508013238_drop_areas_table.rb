class DropAreasTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :areas
  end
end
