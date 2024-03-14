require "rails_helper"

RSpec.describe "Allergens API" do
  describe "#get allergen information" do
    describe "happy paths" do
      it "can get the information for a certain UPC code" do
        get api_v1_allergens_path(upc: "014500021632")

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
  
        expect(attributes).to have_key(:ingredients)
        expect(attributes[:ingredients]).to be_an Array
  
        expect(attributes).to have_key(:allergens)
        expect(attributes[:allergens]).to be_an Array
  
        expect(attributes).to have_key(:lily_eat)
        expect(attributes[:lily_eat]).to be(true).or be(false)
      end
    end
  end
end