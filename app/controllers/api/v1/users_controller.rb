class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user).serialize_user, status: :created
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user).serialize_user
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end