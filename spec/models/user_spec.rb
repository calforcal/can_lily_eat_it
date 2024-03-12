require "rails_helper"

RSpec.describe Users, :model do
  describe "validations"
    it { should validate_presence_of :name }
    it { should have_secure_password :password }
    it { should validate_uniqueness_of :email }
  end
end