class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.belongs_to :users, null: false, foreign_key: true
      
      t.string :query
      t.string :name

      t.timestamps
    end
  end
end
