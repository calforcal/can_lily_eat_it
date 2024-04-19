require "rails_helper"

RSpec.describe "POST User Food" do
  describe "#create" do
    describe "#happy_paths" do
      it "can save a Food to a User through a POST request" do
        user = User.create!(name: "mickey", email: "crazy_unique_email@gmail.com", password: "mickey123", password_confirmation: "mickey123")
        food_1 = user.foods.create!(name: "Bad Cereal", upc_code: "123456789", ingredients: ["Egg", "Soy", "Oats", "Milk"], allergens: ["Soy", "Milk"], lily_eat: false)
        food_2 = user.foods.create!(name: "Good Cereal", upc_code: "987654321", ingredients: ["Wheat", "Beans", "Oats", "Starch"], allergens: [], lily_eat: true)

        expect(user.foods.count).to eq(2)

        new_food_json = {
            "name": "Tyson Chicken Tenders",
            "upc_code": "123456789123",
            "ingredients": ["Bread", "Soy", "Franks", "Beans"],
            "allergens": ["Soy"],
            "lily_eat": false
        }

        post api_v1_sessions_path({ email: user.email, password: user.password })
        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)
        returned_user = parsed[:data]

        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'Authorization': returned_user[:token]}
        post api_v1_foods_path, headers: headers, params: JSON.generate(new_food_json)

        expect(response).to be_successful
        expect(response.status).to eq(201)

        parsed = JSON.parse(response.body, symbolize_names: true)

        food = parsed[:data]

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

        expect(user.foods.length).to eq(3)
      end
    end
  end
end