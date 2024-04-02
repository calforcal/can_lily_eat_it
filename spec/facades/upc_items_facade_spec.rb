require "rails_helper"

RSpec.describe UpcItemsFacade do
  describe "UpcItems" do
    describe "items_query" do
      it "returns information about a specific grocery item" do
        upc_code = "014500021632"
        item = UpcItemsFacade.new.get_item_by_upc(upc_code)

        expect(item).to be_an UpcItem

        expect(item.name).to eq("Seasoned Asian Medley")
        expect(item.upc_code).to eq("014500021632")
        expect(item.ingredients).to eq(["Carrots", "Broccoli", "Baby Cob Corn", "Sugar Snap Peas", "2% Or Less: Soybean Oil", "Salt", "Sugar", "Natural Flavor", "Dehydrated Onion", "Dehydrated Garlic", "Spice"])
        expect(item.allergens).to eq(["2% Or Less: Soybean Oil"])
        expect(item.lily_eat).to eq(false)
      end
    end
  end
end