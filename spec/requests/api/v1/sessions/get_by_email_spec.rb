require "rails_helper"

RSpec.describe "#create_session" do
  describe "#happy paths" do
    it "can start a sesssion based on a users information / email" do
      user_info = {
        "name": "Mickey",
        "email": "crazy_unique_email@gmail.com",
        "password": "mickey123",
        "password_confirmation": "mickey123"
      }

      post api_v1_users_path(user_info)

      json_body = {
        "name": "Mickey",
        "email": "crazy_unique_email@gmail.com"
      }

      post api_v1_sessions_path(json_body)

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
      expect(user[:attributes][:name]).to eq("Mickey")
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to eq("crazy_unique_email@gmail.com")
    end
  end
end