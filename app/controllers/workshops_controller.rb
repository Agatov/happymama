class WorkshopsController < ApplicationController
  def index
    @categories = Category.order(:id).includes(:workshops)
  end

  def show
    @workshop = Workshop.find params[:id]
  end
end