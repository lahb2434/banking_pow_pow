class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def index 
    redirect_to root_path, notice: 'something went wrong' unless @user = User.find_by(id: params[:user_id])
  end

  def show
    return redirect_to user_path, notice: 'something went wrong' unless @user = User.find_by(id: params[:user_id])  
    redirect_to user_path, notice: 'something went wrong' unless @account = @user.accounts.find_by(id: params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    user = User.find(account_params[:user_id])
    acc = user.accounts.build(name: account_params[:name])
    acc.tap do |a|
       case a.name
       when 'checking'
         a.annual_percentage_yield = 0.9
       when 'savings'
         a.annual_percentage_yield = 1.5
       when 'loan'
         a.annual_percentag_rate = 0.3
       end
     a.balance = account_params[:balance].gsub(',','')
     end
     acc.save 
     redirect_to user_accounts_path
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
  
  def account_params
    params.permit(:name, :balance, :user_id)
  end
  
end
