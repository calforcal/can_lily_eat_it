class AllergenSerializer
  def initialize(allergen)
    @allergen = allergen
  end

  def serialize_allergen
    {
      "data": {
        "type": "item",
        "attributes": {
          "name": @allergen.name,
          "allergens": @allergen.allergens,
          "ingredients": @allergen.ingredients,
          "lily_eat": @allergen.lily_eat
        }
      }
    }
  end
end