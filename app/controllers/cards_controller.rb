class CardsController < ApplicationController
  before_action :set_account, only: %i[show]
  before_action :logged_in?

    def show 
    end

    def new
      @card = Card.new
      @account = Account.find(params[:account_id]) unless params[:account_id].nil?
    end

    def create 
      account = Account.find(params[:card][:account_id]) if params[:card][:account_id]
      user = User.find(session[:user_id])

      if card_params[:card_type] == 'Debit'
        card = account.cards.build(card_params)
        card.balance = account.balance
        account.save
        redirect_to user_account_path(user, account)
      else 
        card = user.credit_cards.build(card_params)
        card.balance = 0.0
        card.save 
        redirect_to user_accounts_path(user)
      end
    end

    private

    def set_account
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:card_type, :card_number, :expiration)
    end

    def logged_in?
      session[:user_id]
    end
 
end
