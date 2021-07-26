module UsersHelper
    
    def user_name(user)
      "#{user.first_name} #{user.last_name}"
    end

    def user_loans(user)
      html = ''
      user.loans.each do |loan|  
        html << (content_tag :ul, (content_tag :li, "#{loan.merchandises.first.name} Loan"))
      end
      html.html_safe
    end

    def user_merch(user)
      html = ''
      user.owned_merch.each do |merch|  
        html << (content_tag :ul, (content_tag :li, "#{merch.name}")) 
      end
      html.html_safe
    end

    def user_accounts(user)
      content_tag :ul do 
        user.accounts.map do |acc|    
            account = content_tag(:li, "#{acc.name}  -  balance: #{number_to_currency(acc.balance)}")
            account.insert(-6, inject_cards(acc))
        end.join.html_safe  
      end  
    end

    def inject_cards(acc)
      if acc.cards.any?
        str = content_tag :ul do
          content_tag :li do 
            "Card  #{ cards?(acc) }"
          end 
        end
      end
      str
    end

    def cards?(acc)
        acc.cards.map do |card|
          " - #{card.card_type} #{card.card_number},   exp. #{card.expiration}"
        end.join
    end

    def user_cards(user)
      mark = content_tag :ul do 
        user.accounts.map do |acc|    
            content_tag :li do 
              "#{acc.name}  -  balance: #{number_to_currency(acc.balance)}"
            end
        end.join.html_safe
      end
    end

    def user_credit_cards(user)
      mark = content_tag :ul do 
        user.credit_cards.map do |card|    
            content_tag :li do 
              "#{card.card_type} #{card.card_number},   exp. #{card.expiration} - balance #{number_to_currency(card.balance)}"
            end
        end.join.html_safe
      end
    end
      
end
