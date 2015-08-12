class CreateTeacherDiploms < ActiveRecord::Migration
  def change
    create_table :teacher_diploms do |t|
      t.integer :teacher_id
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
