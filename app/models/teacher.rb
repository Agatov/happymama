class Teacher < ActiveRecord::Base
  has_many :workshop_teachers
  has_many :workshops, through: :workshop_teachers
  mount_uploader :avatar, TeacherAvatarUploader

  validates :name, presence: true
  validates :position, presence: true
  validates :avatar, presence: true
  validates :about, presence: true
end
