class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def index 
    redirect_to root_path, notice: 'something went wrong' unless @user = User.find_by(id: params[:user_id])
  end

  def show
    # return redirect_to user_path, notice: 'something went wrong' unless @user = User.find_by(id: params[:user_id])  
    # redirect_to user_path, notice: 'something went wrong' unless @account = @user.accounts.find_by(id: params[:id])
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
       end
     a.balance = account_params[:balance].gsub(',','')
     end
     acc.save 
     redirect_to user_accounts_path
  end

  def edit 
  end

  def update
    pay_from_account = @user.accounts.find(pay_account_params[:pay_from_account_id])
    pay_from_account.balance -= pay_account_params[:payment_amount].to_f
    pay_from_account.save
    if loan = @user.loans.find(pay_account_params[:pay_to_account_id])
      loan.balance -= pay_account_params[:payment_amount].to_f
      loan.save
        if loan.balance == 0
          merch = loan.merchandises.first 
          merch.user_id = nil 
          merch.account_id = nil 
          merch.owner = @user
          merch.save 
          return redirect_to @user
        end
    else pay_to_account = @user.accounts.find(pay_account_params[:pay_to_account_id])
       pay_to_account.balance += pay_account_params[:payment_amount].to_f
       pay_to_account.save
    end 
    redirect_to user_account_path(@user, pay_to_account || loan)
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
  
  def account_params
    params.permit(:name, :balance, :user_id)
  end

  def pay_account_params
    params.permit(:payment_amount, :pay_to_account_id, :pay_from_account_id)
  end
  
end
