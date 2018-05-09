class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :venue, foreign_key: true
      t.boolean :open, default: true

      t.timestamps
    end
  end
end
