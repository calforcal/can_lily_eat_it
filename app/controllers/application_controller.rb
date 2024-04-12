class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  before_action :set_current_user
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def current_user?
    @current_user == nil ? false : true
  end
end
