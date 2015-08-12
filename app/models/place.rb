class Place < ActiveRecord::Base
  has_many :groops

  geocoded_by :full_street_address, lookup: :google
  after_validation :geocode

  def full_street_address
    I18n.t 'full_address', {address: address}
  end


end
