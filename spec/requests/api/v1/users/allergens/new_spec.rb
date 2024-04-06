require "rails_helper"

RSpec.describe "UserAllergens" do
  describe "#create (no prior allergens have been saved)" do
    it "can create associations between user and allergens" do
      user = User.create!(email: "testemail1@gmail.com", name: "test", password: "test123", password_confirmation: "test123")

      allergens = "dairy,soy,fish"

      expect(user.allergens.count).to eq(0)

      post api_v1_user_allergens_path(user.id, allergens: allergens)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:message)
      expect(parsed[:message]).to eq("Your selections have been saved.")

      expect(user.allergens.count).to eq(3)
    end
  end
end