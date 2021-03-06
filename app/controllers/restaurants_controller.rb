class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    set_restaurant
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to restaurants_path
  end

  def edit
    set_restaurant
  end

  def update
    set_restaurant
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy
    set_restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :rating, :content)
  end
end
