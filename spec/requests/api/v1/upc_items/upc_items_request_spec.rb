require "rails_helper"

RSpec.describe "Upc Items API" do
  describe "#get item information" do
    describe "happy paths" do
      it "can get the information for a certain UPC code and given allergens" do
        allergens = "dairy,soy"
        get api_v1_upc_item_path(id: "null", upc: "014500021632", allergens: allergens)

        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)
  
        expect(parsed).to have_key(:data)
  
        food_item = parsed[:data]
  
        expect(food_item).to have_key(:type)
        expect(food_item[:type]).to eq("food")
        expect(food_item).to have_key(:attributes)
  
        attributes = food_item[:attributes]
  
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a String

        expect(attributes).to have_key(:upc_code)
        expect(attributes[:upc_code]).to be_a String 
  
        expect(attributes).to have_key(:ingredients)
        expect(attributes[:ingredients]).to be_an Array
  
        expect(attributes).to have_key(:allergens)
        expect(attributes[:allergens]).to be_an Array
  
        expect(attributes).to have_key(:lily_eat)
        expect(attributes[:lily_eat]).to be(true).or be(false)
      end

      it "can get the information for a certain UPC code and USERS allergens" do
        post api_v1_sessions_path(email: "rooster@gmail.com", password: "buddy123")
        get api_v1_upc_item_path(id: User.find_by(email: "rooster@gmail.com").id, upc: "014500021632")

        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)
  
        expect(parsed).to have_key(:data)
  
        food_item = parsed[:data]
  
        expect(food_item).to have_key(:type)
        expect(food_item[:type]).to eq("food")
        expect(food_item).to have_key(:attributes)
  
        attributes = food_item[:attributes]
  
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a String

        expect(attributes).to have_key(:upc_code)
        expect(attributes[:upc_code]).to be_a String 
  
        expect(attributes).to have_key(:ingredients)
        expect(attributes[:ingredients]).to be_an Array
  
        expect(attributes).to have_key(:allergens)
        expect(attributes[:allergens]).to be_an Array
  
        expect(attributes).to have_key(:lily_eat)
        expect(attributes[:lily_eat]).to be(true).or be(false)
      end
    end

    describe "#sad paths" do
      it "can handle a bad UPC code request " do
        allergens = "dairy,soy"
        get api_v1_upc_item_path(id: "null", upc: "10987654321", allergens: allergens)

        expect(response).to be_successful
        expect(response.status).to eq(204)
      end
    end
  end
end