require "rails_helper"

RSpec.describe UserAllergen, :model do
  describe "#associations" do
    it { should belong_to :user }
    it { should belong_to :allergen }
  end
end