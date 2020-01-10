class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :author
      t.string :title
      t.string :description
      t.string :url
      t.string :urlToImage
      t.datetime :publishedAt
      t.string :content
      t.belongs_to :users, null: false, foreign_key: true
      t.timestamps
    end
  end
end
