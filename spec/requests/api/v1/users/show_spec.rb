require "rails_helper"

RSpec.describe "User by ID" do
  describe "#show" do
    describe "#happy paths" do
      it "can get a users information by ID" do
        created_user = User.create!(name: "mickey", email: "crazy_unique_email@gmail.com", password: "mickey123", password_confirmation: "mickey123")
  
        get api_v1_user_path(created_user.id)
  
        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)  
        user = parsed[:data]

        expect(user).to have_key(:id)
        expect(user).to have_key(:type)
        expect(user[:type]).to eq("user")
        expect(user).to have_key(:attributes)
  
        expect(user[:attributes]).to have_key(:name)
        expect(user[:attributes][:name]).to eq("mickey")
        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to eq("crazy_unique_email@gmail.com")
      end
    end
  end
end