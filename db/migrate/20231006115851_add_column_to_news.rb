class AddColumnToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :isHide, :boolean
  end
end
