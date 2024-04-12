class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serialize_user, status: :created
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def show
    user = User.find(params[:id])
    session[:user_id] = user.id
    render json: UserSerializer.new(user).serialize_user, status: :ok
  end

  def destroy
    session.delete :user_id
    render json: { message: "You have been successfully logged out." }
  end
end