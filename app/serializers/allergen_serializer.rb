class AllergenSerializer
  def initialize

  end

  def serialize_user_allergens(allergens)
    {
      "data": allergens.map do |allergen|
        {
          "id": allergen.id,
          "type": "allergen",
          "attributes": {
            "name": allergen.name,
            "found_in": allergen.found_in
          }
        }
      end
    }
  end
end