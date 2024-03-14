class Api::V1::AllergensController < ApplicationController
  def index
    allergen = AllergensFacade.new.get_allergen_by_upc(params[:upc])
    render json: FoodSerializer.new.serialize_one_food(allergen)
  end
end
