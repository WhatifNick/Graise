class RemoveAreaFromVenue < ActiveRecord::Migration[5.1]
  def change
    remove_column :venues, :area_id, :string
  end
end
