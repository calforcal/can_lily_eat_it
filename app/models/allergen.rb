class Allergen < ApplicationRecord
  validates_presence_of :name, :found_in

  has_many :user_allergens
  has_many :users, through: :user_allergens
end