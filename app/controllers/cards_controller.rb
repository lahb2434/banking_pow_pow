class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update]

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

    def edit 
      @user = User.find(params[:user_id])
    end

    def update 
      @account = User.find(params[:user_id]).accounts.find(params[:account_id])
      if params[:payment_amount]
        @card.balance -= params[:payment_amount].to_f
        @card.save
        @account.balance -= params[:payment_amount].to_f 
        @account.save
      end 
      @card.balance += params[:purchase_amount].to_f if params[:purchase_amount]
      @card.save 
      redirect_to @card
    end

    private

    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:card_type, :card_number, :expiration)
    end

    def card_params_for_update_action
      params.require(:card).permit(:balance)
    end
end
