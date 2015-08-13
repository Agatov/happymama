class Groop < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :place

  def seats_available
    if total_seats and reserved_seats
      total_seats - reserved_seats 
    else
      nil
    end
  end
end
