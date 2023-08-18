class ReviewsController < ApplicationController
  # We need to find the List associated with the review
  before_action :set_list, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @review.list = @list
    @review.save
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
