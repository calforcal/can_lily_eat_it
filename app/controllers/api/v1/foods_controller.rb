class Api::V1::FoodsController < ApplicationController
  def index
    foods = current_user.foods
    render json: FoodSerializer.new.serialize_all_foods(foods), status: :ok
  end

  def create
    new_food = current_user.foods.create!(food_params)
    render json: FoodSerializer.new.serialize_one_food(new_food), status: :created
  end

  def destroy
    food = Food.find(params[:id])
    user_food = UserFood.find_by_user_and_food_id(current_user.id, food.id)
    user_food.delete
    food.delete
    render json: FoodSerializer.new.serialize_all_foods(current_user.foods), status: :ok
  end

  private
  def food_params
    params.permit(:name, :upc_code, :lily_eat, ingredients:[], allergens:[])
  end
end