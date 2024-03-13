require "rails_helper"

RSpec.describe Food, :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :upc_code }
    it { should validate_presence_of :lily_eat }
  end

  describe "#associations" do
    it { should have_many :user_foods }
    it { should have_many(:users).through(:user_foods) }
  end
end