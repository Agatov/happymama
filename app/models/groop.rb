class Groop < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :place

  def seats_available
    total_seats - reserved_seats
  end
end
