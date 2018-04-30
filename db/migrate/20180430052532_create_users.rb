class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :image
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :bio
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
