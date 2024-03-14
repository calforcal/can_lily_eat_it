class Api::V1::FoodsController < ApplicationController
  before_action :get_user
  def index
    foods = @user.foods
    render json: FoodSerializer.new.serialize_all_foods(foods), status: :ok
  end

  def create
    new_food = @user.foods.create!(food_params)
    render json: FoodSerializer.new.serialize_one_food(new_food), status: :created
  end

  def destroy
    food = Food.find(params[:id])
    user_food = UserFood.find_by_user_and_food_id(@user.id, food.id)
    user_food.delete
    food.delete
    render json: FoodSerializer.new.serialize_all_foods(@user.foods), status: :ok
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def food_params
    params.permit(:name, :upc_code, :lily_eat, ingredients:[], allergens:[])
  end
end