class SiteController < ApplicationController
  skip_before_action :signed_in?, only: [:welcome]

  def welcome 
  end

  def total_debt #make view for this thing
    @user = User.find(params[:user_id])
    loan_total = @user.accounts.added_up
    card_total = @user.credit_cards.added_up
    @total = loan_total + card_total
  end
  
end