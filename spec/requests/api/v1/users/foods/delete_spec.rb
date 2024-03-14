require "rails_helper"

RSpec.describe "DELETE User Food" do
  describe "#destroy" do
    describe "#happy_paths" do
      it "can delete a Users saved Food with a DELETE request" do
        user = User.create!(name: "mickey", email: "crazy_unique_email@gmail.com", password: "mickey123", password_confirmation: "mickey123")
        food_1 = user.foods.create!(name: "Bad Cereal", upc_code: "123456789", ingredients: ["Egg", "Soy", "Oats", "Milk"], allergens: ["Soy", "Milk"], lily_eat: false)
        food_2 = user.foods.create!(name: "Good Cereal", upc_code: "987654321", ingredients: ["Wheat", "Beans", "Oats", "Starch"], allergens: [], lily_eat: true)

        expect(user.foods.count).to eq(2)

        delete api_v1_user_food_path(user.id, food_1.id)

        expect(response).to be_successful
        expect(response.status).to eq(204)

        expect(user.foods.count).to eq(1)
      end
    end
  end
end