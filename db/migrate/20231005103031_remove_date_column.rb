class RemoveDateColumn < ActiveRecord::Migration[7.0]
  def change
     remove_column :news, :news_date
  end
end
