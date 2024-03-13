require "rails_helper"

RSpec.describe "Current Session" do
  describe "#destroy" do
    describe "#happy paths" do
      it "can end a logged-in users current session" do
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

        get "/api/v1/logged_in"

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed[:data][:type]).to eq("user")

        delete "/api/v1/logout"

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed[:message]).to eq("You have been successfully logged out.")
      end
    end
  end
end