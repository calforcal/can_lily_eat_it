class Api::V1::AllergensController < ApplicationController
  def index
    render json: AllergenSerializer.new.serialize_user_allergens(current_user.allergens)
  end

  def create
    if current_user.allergens.count == 0
      params[:allergens].split(",").each do |allergen|
        found_allergen = Allergen.find_by(name: allergen)
        UserAllergen.create!(user_id: current_user.id, allergen_id: found_allergen.id)
      end
      code = 201
    else
      locate_and_update_allergens
      code = 200
    end

    render json: { message: "Your selections have been saved." }, status: code
  end

  def update
    locate_and_update_allergens

    render json: { message: "Your selections have been saved." }, status: 200
  end

  def locate_and_update_allergens
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
      user_allergen = UserAllergen.find_by(user_id: current_user.id, allergen_id: found_allergen.id)

      if arr[1] == true && user_allergen == nil
        UserAllergen.create!(user_id: current_user.id, allergen_id: found_allergen.id)
      elsif arr[1] == false && user_allergen != nil
        UserAllergen.find_by(user_id: current_user.id, allergen_id: found_allergen.id).destroy
      end
    end
  end

  private
  def allergen_params
    params.permit(:user_id, :allergen_id)
  end
end