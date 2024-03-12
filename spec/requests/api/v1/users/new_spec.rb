require "rails_helper"

RSpec.describe "Users API" do
  describe "#create new user" do
    describe "#happy paths" do
      it "can create a new user with registration info" do
        user_info = {
          "name": "Mickey",
          "email": "mickey@gmail.com",
          "password": "mickey123",
          "password_confirmation": "mickey123"
        }
        
        post api_v1_users_path(user_info)

        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)

        expect(parsed).to have_key(:data)
  
        user = parsed[:data]

        expect(user).to have_key(:id)
        expect(user).to have_key(:type)
        expect(user[:type]).to eq("user")
        expect(user).to have_key(:attributes)

        expect(user[:attributes]).to have_key(:name)
        expect(user[:name]).to eq("Mickey")
        expect(user[:attributes]).to have_key(:email)
        expect(user[:email]).to eq("mickey@gmail.com")
      end
    end
  end
end