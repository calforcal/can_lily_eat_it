class Allergen
  attr_reader :name, :allergens, :ingredients, :lily_eat
  def initialize(details)
    @name = details[:title]
    @allergens = parse_allergens(details)
    @ingredients = split_ingredients(details)
    @lily_eat = can_lily_eat?(details)
  end

  def known_allergens
    {
      "acidophilus milk"=>true,
      "ammonium caseinate"=>true,
      "butter"=>true,
      "butter esters"=>true,
      "butter fat"=>true,
      "butter oil"=>true,
      "butter solids"=>true,
      "buttermilk"=>true,
      "buttermilk powder"=>true,
      "calcium caseinate"=>true,
      "casein"=>true,
      "caseinate"=>true,
      "cheese"=>true,
      "condensed milk"=>true,
      "cottage cheese"=>true,
      "cream"=>true,
      "curds"=>true,
      "delactosed whey"=>true,
      "demineralized whey"=>true,
      "dry milk powder"=>true,
      "dry milk solids"=>true,
      "evaporated milk"=>true,
      "ghee"=>true,
      "goat cheese"=>true,
      "goat milk"=>true,
      "half & half"=>true,
      "hydrolyzed casein"=>true,
      "hydrolyzed milk protein"=>true,
      "iron caseinate"=>true,
      "lactalbumin"=>true,
      "lactoferrin"=>true,
      "lactoglobulin"=>true,
      "lactose"=>true,
      "lactulose"=>true,
      "low-fat milk"=>true,
      "magnesium caseinate"=>true,
      "malted milk"=>true,
      "milk"=>true,
      "milk derivative"=>true,
      "milk fat"=>true,
      "milk powder"=>true,
      "milk protein"=>true,
      "milk solids"=>true,
      "natural Butter flavor"=>true,
      "nonfat milk"=>true,
      "nougat"=>true,
      "paneer"=>true,
      "potasium caseinate"=>true,
      "recaldent"=>true,
      "rennet casein"=>true,
      "sheep milk"=>true,
      "sheep milk cheese"=>true,
      "skim milk"=>true,
      "sodium caseinate"=>true,
      "sour cream"=>true,
      "sour milk solids"=>true,
      "sweetened condensed milk"=>true,
      "sweet whey"=>true,
      "whey"=>true,
      "whey powder"=>true,
      "whey protein concentrate"=>true,
      "whey protein hydrolysate"=>true,
      "whipped cream"=>true,
      "whipped topping"=>true,
      "whole milk"=>true,
      "yogurt"=>true,
      "zinc caseinate"=>true,
      "hydrolyzed soy protein" => true,
      "hsp" => true,
      "miso" => true,
      "kinnoko flour" => true,
      "kyodofu" => true,
      "natto" => true,
      "autolyzed yeast" => true,
      "carob" => true,
      "gelatin" => true,
      "lecithin" => true,
      "licorice" => true,
      "mono & diglycerides" => true,
      "monosodium glutamate" => true,
      "msg" => true,
      "glycine max" => true,
      "soy sauce" => true,
      "tamari" => true,
      "shoyu sauce" => true,
      "soy albumin" => true,
      "soy concentrate" => true,
      "soy" => true,
      "soya" => true,
      "soya flour" => true,
      "teriyaki" => true,
      "oyster sauce" => true,
      "fish sauce" => true,
      "soy beans" => true,
      "soybeans" => true,
      "soybean" => true,
      "soy bean" => true,
      "soy nuts" => true,
      "soy formula" => true,
      "soy miso" => true,
      "soy nut butter" => true,
      "soy flour" => true,
      "soy grits" => true,
      "soy fiber" => true,
      "okara" => true,
      "soy pulp" => true,
      "soy bran" => true,
      "soy isolate fiber" => true,
      "soy milk" => true,
      "soy sprouts" => true,
      "tempeh" => true,
      "textured vegetable protein" => true,
      "tvp" => true,
      "textured soy protein" => true,
      "tsp" => true,
      "textured soy flour" => true,
      "tsf" => true,
      "supro" => true,
      "yakidofu" => true,
      "soybean granules" => true,
      "soybean paste" => true,
      "tofu" => true,
      "yuba" => true,
      "bean curd" => true,
      "soybean curd" => true,
      "soy protein concentrate" => true,
      "soy protein isolate" => true,
      "edamame" => true
    }
  end

  def split_ingredients(details)
    ingr = details[:metadata][:ingredients].split(", ")
    if ingr[-1][-1] == "."
      ingr[-1].chop!
    end
    ingr.map do |arr|
      arr.split(" ").map { |word| word.capitalize }.join(" ")
    end
  end

  def parse_allergens(details)
    found_allergens = []
    split_ingredients(details).each do |list|
      list.split(" ").each do |ingredient|
        if known_allergens[ingredient.downcase]
          found_allergens << list
          next
        end
      end
    end
    found_allergens
  end

  def can_lily_eat?(details)
    parse_allergens(details).any? ? false : true
  end
end