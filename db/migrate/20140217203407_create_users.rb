class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :bio, null: false, limit: 140
      t.string :session_token, null: false
      t.boolean :activated, default: false

      t.timestamps
    end

    add_index :users, :email, unique:true
    add_index :users, :session_token, unique:true
  end
end
