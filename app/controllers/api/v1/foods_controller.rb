class Api::V1::FoodsController < ApplicationController
  before_action :get_user
  def index
    foods = @user.foods
    render json: FoodSerializer.new.serialize_all_foods(foods), status: :ok
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end
end