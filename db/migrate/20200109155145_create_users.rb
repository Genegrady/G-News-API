class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :password_digest, null: false, index: true, unique: true
      t.string :role, null: false, default: 'user'
      t.datetime :last_login
      t.timestamps
    end
  end
end
