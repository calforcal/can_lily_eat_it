class Api::V1::AllergensController < ApplicationController
  before_action :get_user
  def create
    if @user.allergens.count == 0
      params[:allergens].split(",").each do |allergen|
        found_allergen = Allergen.find_by(name: allergen)
        UserAllergen.create!(user_id: @user.id, allergen_id: found_allergen.id)
      end
    end

    render json: { message: "Your selections have been saved." }, status: 201
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def allergen_params
    params.permit(:user_id, :allergen_id)
  end
end