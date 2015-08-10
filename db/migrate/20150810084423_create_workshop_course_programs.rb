class CreateWorkshopCoursePrograms < ActiveRecord::Migration
  def change
    create_table :workshop_course_programs do |t|
      t.integer :workshop_id
      t.integer :day
      t.string :title
      t.text :theoretical_part
      t.text :practical_part

      t.timestamps null: false
    end
  end
end
