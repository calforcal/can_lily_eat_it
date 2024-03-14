require "rails_helper"

RSpec.describe "Users Foods" do
  describe "#index" do
    describe "#happy paths" do
      it "can get all of a users saved foods" do
        user = User.create!(name: "mickey", email: "crazy_unique_email@gmail.com", password: "mickey123", password_confirmation: "mickey123")
        food_1 = user.foods.create!(name: "Bad Cereal", upc_code: "123456789", ingredients: ["Egg", "Soy", "Oats", "Milk"], allergens: ["Soy", "Milk"], lily_eat: false)
        food_2 = user.foods.create!(name: "Good Cereal", upc_code: "987654321", ingredients: ["Wheat", "Beans", "Oats", "Starch"], allergens: [], lily_eat: true)

        get api_v1_user_foods_path(user.id)

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)

        foods = parsed[:data]
        expect(foods).to be_an array
        
        foods.each do |food|
          expect(food).to be_a Hash
          expect(food).to have_key(:id)
          expect(food).to have_key(:type)
          expect(food[:type]).to eq("food")
          expect(food).to have_key(:attributes)
          expect(food[:attributes]).to be_a Hash

          expect(food[:attributes]).to have_key(:name)
          expect(food[:attributes]).to have_key(:upc_code)
          expect(food[:attributes]).to have_key(:ingredients)
          expect(food[:attributes]).to have_key(:allergens)
          expect(food[:attributes]).to have_key(:lily_eat)
        end

        expect(foods.length).to eq(2)
      end
    end
  end
end