class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :number, null: false, limit: 10
      t.references :person, null: false, index: true
      t.date :issued_on, null: false, null: false
      t.date :ended_on, null: false, null: false
    end

    add_index :licenses, :number, unique: true
  end
end
