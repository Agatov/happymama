class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.integer :category_id
      t.string :name
      t.text :about
      t.string :image
      t.integer :duration
      t.integer :price
      t.text :description
      t.boolean :course, default: false
      t.integer :course_price
      t.integer :workshops_count
      t.boolean :popular, default: false

      t.timestamps null: false
    end
  end
end
