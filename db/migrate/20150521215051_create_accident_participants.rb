class CreateAccidentParticipants < ActiveRecord::Migration
  def change
    create_table :accident_participants do |t|
      t.references :accident, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false
      t.references :vehicle, index: true, foreign_key: true, null: false
    end
  end
end
