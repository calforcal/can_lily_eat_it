require "rails_helper"

RSpec.describe "UserAllergens" do
  describe "#update (prior allergens have been saved)" do
    it "can update associations between user and allergens" do
      user = User.create!(email: "testemail1@gmail.com", name: "test", password: "test123", password_confirmation: "test123")
      soy_allergy = UserAllergen.create!(user_id: user.id, allergen_id: Allergen.find_by(name:"soy").id)
      
      expect(user.allergens.count).to eq(1)

      allergens = "dairy,peanut,fish"

      user.allergens.reload

      patch api_v1_user_allergens_path(user.id, allergens: allergens)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:message)
      expect(parsed[:message]).to eq("Your selections have been saved.")

      expect(user.allergens.count).to eq(3)
    end
  end
end