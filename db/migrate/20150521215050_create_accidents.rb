class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.datetime :occured_at
      t.string :protocol_number
      t.text :notes

      t.timestamps null: false
    end
  end
end
