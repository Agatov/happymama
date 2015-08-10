class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :position
      t.string :avatar
      t.string :about

      t.timestamps null: false
    end
  end
end
