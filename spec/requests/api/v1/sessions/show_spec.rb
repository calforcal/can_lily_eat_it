require "rails_helper"

RSpec.describe "Current Session" do
  describe "#show" do
    describe "#happy paths" do
      it "can get a logged-in users current session" do
        created_user = User.create!(name: "mickey", email: "crazy_unique_email@gmail.com", password: "mickey123", password_confirmation: "mickey123")

        json_body = {
          "name": "mickey",
          "email": "crazy_unique_email@gmail.com",
          "password": "mickey123"
        }
  
        post api_v1_sessions_path(json_body)
  
        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)  
        user = parsed[:data]

        get "/api/v1/logged_in/#{user[:id]}"

        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)  
        logged_in_user = parsed[:data]

        expect(logged_in_user).to have_key(:id)
        expect(logged_in_user).to have_key(:type)
        expect(logged_in_user[:type]).to eq("user")
        expect(logged_in_user).to have_key(:attributes)
  
        expect(logged_in_user[:attributes]).to have_key(:name)
        expect(logged_in_user[:attributes][:name]).to eq("mickey")
        expect(logged_in_user[:attributes]).to have_key(:email)
        expect(logged_in_user[:attributes][:email]).to eq("crazy_unique_email@gmail.com")
      end
    end
  end
end