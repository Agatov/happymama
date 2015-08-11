class WorkshopTeacher < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :teacher
end
