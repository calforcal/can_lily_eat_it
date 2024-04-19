class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = issue_token(user)
      render json: UserSerializer.new(user, token).serialize_user, status: :created
    else
      render json: { error: 'Invalid credentials.' }, status: :unauthorized
    end
  end

  def show
    if logged_in?
      render json: UserSerializer.new(current_user, request.authorization).serialize_user, status: :ok
    else
      render json: { message: "Please login to continue." }
    end
  end
end