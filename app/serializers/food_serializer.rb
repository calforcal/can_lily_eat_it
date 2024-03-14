class FoodSerializer
  def initialize
    
  end

  def serialize_one_food(food)
    if food.id != nil
      {
        "data": {
          "id": food.id,
          "type": "food",
          "attributes": {
            "name": food.name,
            "upc_code": food.upc_code,
            "allergens": food.allergens,
            "ingredients": food.ingredients,
            "lily_eat": food.lily_eat
          }
        }
      }
    else
      {
        "data": {
          "type": "food",
          "attributes": {
            "name": food.name,
            "upc_code": food.upc_code,
            "allergens": food.allergens,
            "ingredients": food.ingredients,
            "lily_eat": food.lily_eat
          }
        }
      }
    end
  end

  def serialize_all_foods(foods)
    {
      "data": foods.map do |food|
        {
          "id": food.id,
          "type": "food",
          "attributes": {
            "name": food.name,
            "upc_code": food.upc_code,
            "allergens": food.allergens,
            "ingredients": food.ingredients,
            "lily_eat": food.lily_eat
          }
        }
      end
    }
  end
end