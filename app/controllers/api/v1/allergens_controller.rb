class Api::V1::AllergensController < ApplicationController
  def index
    allergen = AllergensFacade.new.get_allergen_by_upc(params[:upc])
    if allergen.is_a?(Allergen)
      render json: FoodSerializer.new.serialize_one_food(allergen)
    else
      render json: allergen, status: 204
    end
  end
end
