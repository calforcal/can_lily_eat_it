class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :password
  validates_uniqueness_of :email

  has_many :user_foods
  has_many :foods, through: :user_foods
  has_many :user_allergens
  has_many :allergens, through: :user_allergens

  def get_user_allergens
    merged_allergens = {}
    allergens.each { |allergen| merged_allergens.merge!(allergen.found_in) }
    merged_allergens
  end
end