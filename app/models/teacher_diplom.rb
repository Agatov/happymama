class TeacherDiplom < ActiveRecord::Base
  belongs_to :teacher
  mount_uploader :image, TeacherDiplomImageUploader
end
