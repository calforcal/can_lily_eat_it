class UserSerializer
  def initialize(user_info)
    @user_info = user_info
  end

  def serialize_user
    {
      "data": {
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