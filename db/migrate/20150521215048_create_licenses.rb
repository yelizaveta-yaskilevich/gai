class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.references :person, index: true, foreign_key: true
      t.date :issued_on
      t.date :ended_on

      t.timestamps null: false
    end
  end
end
