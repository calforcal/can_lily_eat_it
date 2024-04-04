class UserAllergen < ApplicationRecord
  belongs_to :user
  belongs_to :allergen

  validates_uniqueness_of :user_id, scope: :allergen_id
end