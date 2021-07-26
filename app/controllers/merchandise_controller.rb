class MerchandiseController < ApplicationController
    
    def store
        @merchandise = Merchandise.new
    end

    def new
     render layout: 'application'
    end

    def create 
      if loan_account_params.include?(:account_name)
        @account = Account.new(name: loan_account_params[:account_name], balance: loan_account_params[:balance] )
        @account.annual_percentage_rate = 0.3
        merch = @user.merchandises.create(account: @account)
        merch.update(merch_params)
        @account.save 
        return redirect_to user_account_path(@user, @account)
      else
        user = User.find_by(card_owner_params)
        card = user.credit_cards.find_by(credit_card_params)
          if user == @user
            card.update(card_balance_params)
            @user.owned_merch.create(merch_params)
          end
        redirect_to user_accounts_path(@user)
      end 
    end
    
    private
    def merch_params
      params.permit(:name, :price)
    end

    def loan_account_params
      params[:balance] = params[:price]
      params.permit(:account_name, :balance)
    end

    def credit_card_params
        params.permit(:card_number)
    end
    
    def card_owner_params
      params.permit(:first_name, :last_name)
    end 

    def card_balance_params
        params.permit(:balance)
    end

end
