class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :image
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :style
      t.text :about
      t.string :street_address
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
