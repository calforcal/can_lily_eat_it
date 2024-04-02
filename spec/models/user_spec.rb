require "rails_helper"

RSpec.describe User, :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should have_secure_password :password }
    it { should validate_uniqueness_of :email }
  end


  describe "#associations" do
    it { should have_many :user_foods }
    it { should have_many(:foods).through(:user_foods) }
    it { should have_many :user_allergens }
    it { should have_many(:allergens).through(:user_allergens) }
  end
end