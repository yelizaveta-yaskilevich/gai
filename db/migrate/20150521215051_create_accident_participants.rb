class CreateAccidentParticipants < ActiveRecord::Migration
  def change
    create_table :accident_participants do |t|
      t.references :accident, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.references :vehicle, index: true, foreign_key: true
      t.boolean :is_driver

      t.timestamps null: false
    end
  end
end
