class ContactsController < ApplicationController
  def index
    @places = Place.order(:id)
  end
end