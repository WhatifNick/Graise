class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :post_code

      t.timestamps
    end
  end
end
