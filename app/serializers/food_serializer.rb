class FoodSerializer
  def initialize
    
  end

  def serialize_one_food(food)
    {
      "data": {
        "type": "food",
        "attributes": {
          "name": food.name,
          "allergens": food.allergens,
          "ingredients": food.ingredients,
          "lily_eat": food.lily_eat
        }
      }
    }
  end
end