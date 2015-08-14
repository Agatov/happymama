class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @categories = Category.order(:id)

    @course_groops = Groop.joins(:workshop).where("workshops.course = ?", true).order("date").limit(5)
    @seminar_groops = Groop.joins(:workshop).where("workshops.course = ?", false).order("date").limit(5)

    @teachers = Teacher.order(:id)

    @reviews_count = Review.count
  end
end
