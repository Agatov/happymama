class Groop < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :place

  validates :workshop_id, presence: true
  validates :place_id, presence: true

  def seats_available
    if total_seats and reserved_seats
      total_seats - reserved_seats 
    else
      nil
    end
  end
end
