class ReviewsController < ApplicationController
  def index
    @reviews = Review.order('id desc')
  end
end