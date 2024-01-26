require "rails_helper"

RSpec.describe AllergensFacade do
  describe "Allergens" do
    describe "allergens_query" do
      it "returns information about a specific grocery item" do
        upc_code = "014500021632"
        allergen = AllergensFacade.new.allergens_query(upc_code)

        expect(allergen).to be_an Allergen

        expect(allergen.name).to eq("Seasoned asian medley")
        expect(allergen.ingredients).to eq(["Carrots", "broccoli", "baby cob corn", "sugar snap peas", "2% or less: soybean oil", "salt", "sugar", "natural flavor", "dehydrated onion", "dehydrated garlic", "spice"])
        expect(allergen.allergens).to eq(["2% or less: soybean oil"])
        expect(allergen.lily_eat).to eq(false)
      end
    end
  end
end