class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = true if params[:user][:admin]=='1'
    if @user.save
        session[:user_id] = @user.id 
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end
  

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :user_name, 
      :password, 
      :password_confirmation, 
      :email, 
      :telephone_number, 
      :birth_date, 
      :admin)
  end
    
end
