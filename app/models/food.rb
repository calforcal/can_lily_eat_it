class Food < ApplicationRecord
  validates_presence_of :name, :upc_code
  validates :lily_eat,
      :inclusion => {:in => [true, false], :message => "can't be blank"}

  has_many :user_foods
  has_many :users, through: :user_foods
end