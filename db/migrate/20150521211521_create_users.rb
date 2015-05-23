class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username, null: false
      t.string :encrypted_password, null: false
      t.datetime :remember_created_at
    end

    add_index :users, :username, unique: true
  end
end
