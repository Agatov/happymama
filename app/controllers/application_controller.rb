class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  after_action :allow_iframe

  def index
    @categories = Category.order(:id)

    @course_groops = Groop.joins(:workshop).where("workshops.course = ?", true).order("date").limit(5)
    @seminar_groops = Groop.joins(:workshop).where("workshops.course = ?", false).order("date").limit(5)

    @teachers = Teacher.order(:number)

    @reviews_count = Review.count
    @discount_workshop = Workshop.where('discount is not null').first
  end

  def surprise
    @categories = Category.order(:id)

    @course_groops = Groop.joins(:workshop).where("workshops.course = ?", true).order("date").limit(5)
    @seminar_groops = Groop.joins(:workshop).where("workshops.course = ?", false).order("date").limit(5)

    @teachers = Teacher.order(:number)

    @reviews_count = Review.count
    @discount_workshop = Workshop.where('discount is not null').first
  end

  def allow_iframe
    response.headers.delete "X-Frame-Options"
  end
end
