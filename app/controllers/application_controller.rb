class ApplicationController < ActionController::Base
  before_action :signed_in?
    
  private

  def signed_in?
    redirect_to root_path unless session[:user_id].present? && @user = User.find(session[:user_id])
  end
end
