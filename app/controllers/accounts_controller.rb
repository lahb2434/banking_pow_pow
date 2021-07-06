class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def show
  end

  def new
  end

  def create
    acc = user.accounts.build(name: params)
    acc.tap do |a|
       case a.name
       when 'checking'
         a.annual_percentage_yield = 0.9
       when 'savings'
         a.annual_percentage_yield = 1.5
       when 'loan'
         a.annual_percentag_rate = 0.3
       end
     a.balance = params[:balance]
     end
  end

  private

  def set_account
    @user = User.find(params[:id])
  end
  
  def account_params
    params.require(:account).permit(
      )
  end
  
end
