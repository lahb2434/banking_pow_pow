class SessionsController < ApplicationController

  def create
   
    if auth
      @user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.password_confirmation = user.password
        user.first_name = auth.info.name.split[0]
        user.last_name = auth.info.name.split[-1]
        user.user_name = auth.info.name.gsub(' ', %w(! @ # $ % ^ & * -).sample) + '-' + rand(9).to_s 
      end        
    else
      @user = User.find_by(user_name: params[:user_name])
      return redirect_to root_path, notice: 'wrong login id or password' unless @user.present? && @user.authenticate(params[:password])
    end
    session[:user_id] = @user.id
   
    redirect_to user_accounts_path(@user)
  end

  def logout
    session.delete :user_id && auth.clear if auth
    redirect_to root_path
  end

  private
    
      def auth
        request.env['omniauth.auth']
      end

end
