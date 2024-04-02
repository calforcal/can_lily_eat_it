class Api::V1::UpcItemsController < ApplicationController
  def index
    item = UpcItemsFacade.new.get_item_by_upc(params[:upc])
    if item.is_a?(UpcItem)
      render json: FoodSerializer.new.serialize_one_food(item)
    else
      render json: item, status: 204
    end
  end
end
