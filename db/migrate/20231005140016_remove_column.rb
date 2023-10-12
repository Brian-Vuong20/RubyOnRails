class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username
  end
end
