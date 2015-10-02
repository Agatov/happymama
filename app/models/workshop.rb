class Workshop < ActiveRecord::Base
  belongs_to :category
  has_many :workshop_teachers
  has_many :teachers, through: :workshop_teachers
  has_many :groops
  has_many :workshop_course_programs
  has_many :orders
  mount_uploader :image, WorkshopImageUploader

  validates :category_id, presence: true
  validates :name, length: {minimum: 1}

end
