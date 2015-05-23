class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.datetime :occured_at, null: false
      t.string :protocol_number, null: false
      t.text :notes
    end

    add_index :accidents, :protocol_number, unique: true
  end
end
