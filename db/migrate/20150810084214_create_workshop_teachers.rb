class CreateWorkshopTeachers < ActiveRecord::Migration
  def change
    create_table :workshop_teachers do |t|
      t.integer :workshop_id
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
