class ReviewsController < ApplicationController
  respond_to :html, :json
  def new
    @review = Review.new
    @review.restaurant_id = params[:restaurant_id]
  end
  
  def create
    @review = Review.new(params[:review])
    
    @review.save
    respond_with(@review)
  end
  
  def show
    @review = Review.find(params[:id])
    
    respond_with(@review)
  end
  
  def index
    @reviews = Review.where(:restaurant_id => params[:restaurant_id])
    
    respond_with(@reviews)
  end
end
