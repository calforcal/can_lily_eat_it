require "rails_helper"

RSpec.describe Allergen, :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :found_in }
  end

  describe "#associations" do
    it { should have_many :user_allergens }
    it { should have_many(:users).through(:user_allergens) }
  end
end