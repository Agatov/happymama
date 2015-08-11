class CreateGroops < ActiveRecord::Migration
  def change
    create_table :groops do |t|
      t.integer :workshop_id
      t.integer :place_id
      t.datetime :date
      t.string :time
      t.integer :total_seats
      t.integer :reserved_seats, default: 0

      t.timestamps null: false
    end
  end
end
