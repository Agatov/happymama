class ChangeTeacherPositionType < ActiveRecord::Migration
  def change
    change_column :teachers, :position,  :text
  end
end
