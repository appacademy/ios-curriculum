class HomeController < ApplicationController
  def get
    if params.include?(:id)
      @g = Greeting.all.shuffle.first
    else
      @g = Greeting.find(params[:id])
    end
  end
end