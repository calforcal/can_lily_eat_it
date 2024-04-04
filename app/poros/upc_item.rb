class UpcItem
  attr_reader :id, :name, :upc_code, :allergens, :ingredients, :lily_eat, :user_allergies
  def initialize(details, upc_code, user_allergies)
    @user_allergies = user_allergies
    @id = nil
    @name = capitalize_name(details[:title])
    @upc_code = upc_code
    @allergens = parse_allergens(details)
    @ingredients = split_ingredients(details)
    @lily_eat = can_lily_eat?(details)
  end

  def capitalize_name(name)
    name.split(" ").map { |word| word.capitalize }.join(" ")
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
        if @user_allergies[ingredient.downcase]
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