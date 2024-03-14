class Api::V1::FoodsController < ApplicationController
  before_action :get_user
  def index
    
  end

  private
  def get_user
    @user = User.find(params[:id])
  end
end