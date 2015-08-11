class Category < ActiveRecord::Base
  has_many :workshops

  validates :name, presence: true
end
