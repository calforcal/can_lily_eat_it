class Api::V1::UpcItemsController < ApplicationController
  def index
    if current_user?
      allergens = @current_user.get_user_allergens
    else
      merged_allergens = {}
      params[:allergens].split(",").each { |allergen| merged_allergens.merge!(Allergen.find_by(name: allergen).found_in) }
      allergens = merged_allergens
    end

    item = UpcItemsFacade.new.get_item_by_upc(params[:upc], allergens)
    if item.is_a?(UpcItem)
      render json: FoodSerializer.new.serialize_one_food(item)
    else
      render json: item, status: 204
    end
  end
end
