require "rails_helper"

RSpec.describe UserFood, :model do
  describe "#associations" do
    it { should belong_to :user }
    it { should belong_to :food }
  end
end