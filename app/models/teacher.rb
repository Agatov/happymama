class Teacher < ActiveRecord::Base
  has_many :workshop_teachers
  has_many :workshops, through: :workshop_teachers
  has_many :teacher_diploms
  accepts_nested_attributes_for :teacher_diploms, allow_destroy: true
  mount_uploader :avatar, TeacherAvatarUploader

  validates :name, presence: true
  validates :position, presence: true
  validates :about, presence: true
end
