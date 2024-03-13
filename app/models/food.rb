class Food < ApplicationRecord
  validates_presence_of :name, :upc_code, :ingredients, :allergens, :lily_eat
end