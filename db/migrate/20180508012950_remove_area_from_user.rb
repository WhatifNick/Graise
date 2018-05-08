class RemoveAreaFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :area_id, :string
  end
end
