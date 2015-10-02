class Workshop < ActiveRecord::Base
  belongs_to :category
  has_many :workshop_teachers, dependent: :destroy
  has_many :teachers, through: :workshop_teachers
  has_many :groops, dependent: :destroy
  has_many :workshop_course_programs, dependent: :destroy
  has_many :orders, dependent: :destroy
  mount_uploader :image, WorkshopImageUploader

  validates :category_id, presence: true
  validates :name, length: {minimum: 1}

end
