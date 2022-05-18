class ReviewsController < ApplicationController

  def new
    set_restaurant
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    set_restaurant
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurants_path
  end

  def edit
    set_review
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
