class AddNumberToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :number, :integer, default: 0
  end
end
