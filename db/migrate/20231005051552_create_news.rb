class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :news_title
      t.text :news_body
      t.string :news_date
      t.has_many :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end