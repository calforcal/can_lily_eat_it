require "rails_helper"

RSpec.describe UserFood, :model do
  describe "#associations" do
    it { should belong_to :user }
    it { should belong_to :food }
  end

  describe "#methods" do
    describe "#find_by_user_and_food_id" do
      it "can find a UserFood by user_id and food_id" do
        user = User.create!(name: "mickey", email: "crazy_unique_email@gmail.com", password: "mickey123", password_confirmation: "mickey123")
        food = Food.create!(name: "Bad Cereal", upc_code: "123456789", ingredients: ["Egg", "Soy", "Oats", "Milk"], allergens: ["Soy", "Milk"], lily_eat: false)
        user_food = UserFood.create!(user_id: user.id, food_id: food.id)

        expect(user.foods.count).to eq(1)
        expect(UserFood.find_by_user_and_food_id(user.id, food.id)).to eq(user_food)
      end
    end
  end
end