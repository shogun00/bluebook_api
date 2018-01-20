class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.integer :dive_count
      t.string :location
      t.string :spot
      t.date :date
      t.string :entry_type
      t.string :dive_purpose
      t.text :description
      t.time :entry_time
      t.integer :duration
      t.float :max_depth
      t.float :average_depth
      t.float :visibility

      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
