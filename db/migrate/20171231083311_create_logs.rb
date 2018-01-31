class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.integer :dive_count, null: false
      t.string :location, default: '', null: false
      t.string :spot, default: '', null: false
      t.date :date, null: false
      t.integer :entry_style, limit: 1
      t.integer :dive_style, default: 0, null: false, limit: 1
      t.text :note
      t.time :entry_time, null: false
      t.integer :duration, null: false
      t.float :max_depth
      t.float :average_depth
      t.integer :tank_material, default: 0, limit: 1
      t.integer :tank_capacity
      t.integer :air_starting
      t.integer :air_ending
      t.integer :suit_type, limit: 1
      t.integer :suit_thickness
      t.integer :weight
      t.integer :weather, limit: 1
      t.integer :temperature
      t.integer :water_temperature
      t.integer :wave, limit: 1
      t.float :visibility
      t.string :guide
      t.string :buddy
      t.integer :publication, default: 0, null: false, limit: 1

      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
