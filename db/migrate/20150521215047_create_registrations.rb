class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :vehicle, index: true, foreign_key: true
      t.string :number
      t.date :issued_on

      t.timestamps null: false
    end
  end
end
