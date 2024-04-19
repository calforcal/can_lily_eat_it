class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    user = User.new(user_params)
    if user.save
      token = issue_token(user)
      render json: UserSerializer.new(user, token).serialize_user, status: :created
    else
      render json: { messages: user.errors.messages }
    end
  end

  def show
    render json: UserSerializer.new(current_user, token).serialize_user
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end