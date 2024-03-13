require "rails_helper"

RSpec.describe Food, :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :upc_code }
    it { should validate_presence_of :ingredients }
    it { should validate_presence_of :allergens }
    it { should validate_presence_of :lily_eat }
  end
end