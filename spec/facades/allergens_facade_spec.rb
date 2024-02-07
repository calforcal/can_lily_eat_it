require "rails_helper"

RSpec.describe AllergensFacade do
  describe "Allergens" do
    describe "allergens_query" do
      it "returns information about a specific grocery item" do
        upc_code = "014500021632"
        allergen = AllergensFacade.new.get_allergen_by_upc(upc_code)

        expect(allergen).to be_an Allergen

        expect(allergen.name).to eq("Seasoned Asian Medley")
        expect(allergen.ingredients).to eq(["Carrots", "Broccoli", "Baby Cob Corn", "Sugar Snap Peas", "2% Or Less: Soybean Oil", "Salt", "Sugar", "Natural Flavor", "Dehydrated Onion", "Dehydrated Garlic", "Spice"])
        expect(allergen.allergens).to eq(["2% Or Less: Soybean Oil"])
        expect(allergen.lily_eat).to eq(false)
      end
    end
  end
end