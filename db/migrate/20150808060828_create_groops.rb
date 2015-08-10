class CreateGroops < ActiveRecord::Migration
  def change
    create_table :groops do |t|
      t.integer :workshop_id
      t.datetime :date
      t.string :title
      t.integer :available_seats
      t.integer :reserved_seats

      t.timestamps null: false
    end
  end
end
