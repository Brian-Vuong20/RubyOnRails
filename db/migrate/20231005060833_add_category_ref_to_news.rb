class AddCategoryRefToNews < ActiveRecord::Migration[7.0]
  def change
    add_reference :news, :category, null: false, foreign_key: true
  end
end
