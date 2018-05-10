class AddCauseToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :cause, foreign_key: true
  end
end
