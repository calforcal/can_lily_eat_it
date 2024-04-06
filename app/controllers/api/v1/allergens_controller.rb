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

  def update
    allergen_hash = {
      "dairy" => false,
      "soy" => false,
      "fish" => false,
      "shellfish" => false,
      "treenut" => false,
      "peanut" => false,
      "wheat" => false,
      "egg" => false
    }

    params[:allergens].split(",").each { |allergen| allergen_hash[allergen] = true }
    
    allergen_hash.to_a.each do |arr|
      found_allergen = Allergen.find_by(name: arr[0])
      user_allergen = UserAllergen.find_by(user_id: @user.id, allergen_id: found_allergen.id)

      if arr[1] == true && user_allergen == nil
        UserAllergen.create!(user_id: @user.id, allergen_id: found_allergen.id)
      elsif arr[1] == false && user_allergen != nil
        UserAllergen.find_by(user_id: @user.id, allergen_id: found_allergen.id).destroy
      end
    end

    render json: { message: "Your selections have been saved." }, status: 200
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def allergen_params
    params.permit(:user_id, :allergen_id)
  end
end