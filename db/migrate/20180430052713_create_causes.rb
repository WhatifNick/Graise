class CreateCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :causes do |t|
      t.string :image
      t.string :name
      t.string :website
      t.text :about

      t.timestamps
    end
  end
end
