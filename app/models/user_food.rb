class UserFood < ApplicationRecord
  belongs_to :user
  belongs_to :food

  def self.find_by_user_and_food_id(user_id, food_id)
    where(user_id: user_id).where(food_id: food_id).first
  end
end