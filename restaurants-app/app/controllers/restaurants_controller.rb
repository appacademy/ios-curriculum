class RestaurantsController < ApplicationController
  respond_to :html, :json
  
  def index
    @restaurants = Restaurant.all
    
    respond_with(@restaurants)
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    
    respond_with(@restaurant)
  end
  
  def new
    @restaurant = Restaurant.new
    
    respond_with(@restaurant)
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    @restaurant.save
    respond_with(@restaurant)
  end
end
