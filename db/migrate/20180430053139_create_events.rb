class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :image
      t.string :title
      t.string :date
      t.string :time
      t.text :about
      t.references :user, foreign_key: true
      t.references :venue, foreign_key: true
      t.references :cause, foreign_key: true

      t.timestamps
    end
  end
end
