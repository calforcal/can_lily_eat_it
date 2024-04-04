require "rails_helper"

RSpec.describe UpcItemsFacade do
  describe "UpcItems" do
    describe "items_query" do
      it "returns information about a specific grocery item" do
        upc_code = "014500021632"
        user_allergies = {
          "ghee"=>true,
          "milk"=>true,
          "whey"=>true,
          "cream"=>true,
          "curds"=>true,
          "butter"=>true,
          "casein"=>true,
          "cheese"=>true,
          "nougat"=>true,
          "paneer"=>true,
          "yogurt"=>true,
          "lactose"=>true,
          "milk fat"=>true,
          "caseinate"=>true,
          "goat milk"=>true,
          "lactulose"=>true,
          "recaldent"=>true,
          "skim milk"=>true,
          "butter fat"=>true,
          "butter oil"=>true,
          "buttermilk"=>true,
          "sheep milk"=>true,
          "sour cream"=>true,
          "sweet whey"=>true,
          "whole milk"=>true,
          "goat cheese"=>true,
          "half & half"=>true,
          "lactalbumin"=>true,
          "lactoferrin"=>true,
          "malted milk"=>true,
          "milk powder"=>true,
          "milk solids"=>true,
          "nonfat milk"=>true,
          "whey powder"=>true,
          "low-fat milk"=>true,
          "milk protein"=>true,
          "butter esters"=>true,
          "butter solids"=>true,
          "lactoglobulin"=>true,
          "rennet casein"=>true,
          "whipped cream"=>true,
          "condensed milk"=>true,
          "cottage cheese"=>true,
          "iron caseinate"=>true,
          "zinc caseinate"=>true,
          "delactosed whey"=>true,
          "dry milk powder"=>true,
          "dry milk solids"=>true,
          "evaporated milk"=>true,
          "milk derivative"=>true,
          "whipped topping"=>true,
          "acidophilus milk"=>true,
          "sodium caseinate"=>true,
          "sour milk solids"=>true,
          "buttermilk powder"=>true,
          "calcium caseinate"=>true,
          "hydrolyzed casein"=>true,
          "sheep milk cheese"=>true,
          "ammonium caseinate"=>true,
          "demineralized whey"=>true,
          "potasium caseinate"=>true,
          "magnesium caseinate"=>true,
          "natural Butter flavor"=>true,
          "hydrolyzed milk protein"=>true,
          "sweetened condensed milk"=>true,
          "whey protein concentrate"=>true,
          "whey protein hydrolysate"=>true,
          "hsp"=>true,
          "msg"=>true,
          "soy"=>true,
          "tsf"=>true,
          "tsp"=>true,
          "tvp"=>true,
          "miso"=>true,
          "soya"=>true,
          "tofu"=>true,
          "yuba"=>true,
          "carob"=>true,
          "natto"=>true,
          "okara"=>true,
          "supro"=>true,
          "tamari"=>true,
          "tempeh"=>true,
          "edamame"=>true,
          "gelatin"=>true,
          "kyodofu"=>true,
          "soybean"=>true,
          "lecithin"=>true,
          "licorice"=>true,
          "soy bean"=>true,
          "soy bran"=>true,
          "soy milk"=>true,
          "soy miso"=>true,
          "soy nuts"=>true,
          "soy pulp"=>true,
          "soybeans"=>true,
          "teriyaki"=>true,
          "yakidofu"=>true,
          "bean curd"=>true,
          "soy beans"=>true,
          "soy fiber"=>true,
          "soy flour"=>true,
          "soy grits"=>true,
          "soy sauce"=>true,
          "fish sauce"=>true,
          "soya flour"=>true,
          "glycine max"=>true,
          "shoyu sauce"=>true,
          "soy albumin"=>true,
          "soy formula"=>true,
          "soy sprouts"=>true,
          "oyster sauce"=>true,
          "soybean curd"=>true,
          "kinnoko flour"=>true,
          "soybean paste"=>true,
          "soy nut butter"=>true,
          "autolyzed yeast"=>true,
          "soy concentrate"=>true,
          "soybean granules"=>true,
          "soy isolate fiber"=>true,
          "textured soy flour"=>true,
          "mono & diglycerides"=>true,
          "soy protein isolate"=>true,
          "monosodium glutamate"=>true,
          "textured soy protein"=>true,
          "hydrolyzed soy protein"=>true,
          "soy protein concentrate"=>true,
          "textured vegetable protein"=>true
        }

        item = UpcItemsFacade.new.get_item_by_upc(upc_code, user_allergies)

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