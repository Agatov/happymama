class Workshop < ActiveRecord::Base
  belongs_to :category
  has_many :workshop_teachers
  has_many :teachers, through: :workshop_teachers
  has_many :groops
  has_many :workshop_course_programs
  mount_uploader :image, WorkshopImageUploader

end
