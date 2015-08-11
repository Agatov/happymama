class Admin::ReviewsController < AdminController
  def index
    @reviews = Review.order("id desc")
  end

  def create
    review = Review.new review_params
    review.save

    render partial: '/admin/reviews/review', locals: {review: review}
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:image)
  end
end