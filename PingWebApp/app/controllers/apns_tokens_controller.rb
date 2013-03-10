class ApnsTokensController < ApplicationController
  respond_to :json

  def create
    @token = ApnsToken.new(params[:apns_token])

    if @token.save
      render :json => { :success => true }
    else
      render :json => { :errors => @token.errors }
    end
  end
end
