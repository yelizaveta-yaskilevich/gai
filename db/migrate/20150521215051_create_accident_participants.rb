class CreateAccidentParticipants < ActiveRecord::Migration
  def change
    create_table :accident_participants do |t|
      t.references :accident, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false
      t.references :vehicle, index: true, foreign_key: true, null: false
    end

    add_index :accident_participants, [:accident_id, :person_id], unique: true
    add_index :accident_participants, [:accident_id, :vehicle_id], unique: true
  end
end
