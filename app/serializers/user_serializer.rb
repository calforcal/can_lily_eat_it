class UserSerializer
  def initialize(user_info, token)
    @user_info = user_info
    @token = token
  end

  def serialize_user
    {
      "data": {
        "token": @token,
        "id": @user_info.id,
        "type": "user",
        "attributes": {
          "name": @user_info.name,
          "email": @user_info.email
        }
      }
    }
  end
end