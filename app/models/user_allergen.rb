class UserAllergen < ApplicationRecord
  belongs_to :user
  belongs_to :allergen
end