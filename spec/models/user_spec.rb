require "rails_helper"

RSpec.describe User, :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should have_secure_password :password }
    it { should validate_uniqueness_of :email }
  end


  describe "#associations" do
    it { should have_many :user_foods }
    it { should have_many(:foods).through(:user_foods) }
    it { should have_many :user_allergens }
    it { should have_many(:allergens).through(:user_allergens) }
  end

  describe "#Instance Method" do
    describe "#get_user_allergens" do
      user = User.create!(name: "mickey", email: "rooster@gmail.com", password: "buddy123", password_confirmation: "buddy123")
      dairy = Allergen.find(1)
      soy = Allergen.find(2)
      dairy_allergy = user.user_allergens.create!(allergen: dairy)
      soy_allergy = user.user_allergens.create!(allergen: soy)

      it "can return a combined list of all of the ingredients users allergens are found in" do
        expect(user.get_user_allergens).to eq(
          {
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
        )
      end
    end
  end
end