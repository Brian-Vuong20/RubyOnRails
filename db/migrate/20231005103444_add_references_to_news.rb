class AddReferencesToNews < ActiveRecord::Migration[7.0]
  def change
     add_reference :news, :user, foreign_key: true
  end
end
