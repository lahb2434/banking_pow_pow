module MerchandiseHelper

    def store_greeting(product, price)
      mack = content_tag :div, class: "merch_container" do 
        content_tag :div, class: "merch_description" do
          content_tag :p do  
            "Buy a new #{product}"
            "priced at only $ #{formatted_balance(@balance = price)}"
          end
        end
      end
      mack
    end

    def store_products
      store = [
        {name: 'House', price: 200000},
        {name: 'Car', price: 40000},
        {name: 'Boat', price: 35000},
        {name: 'ATV', price: 15000},
        {name: 'Designer Dog Breed', price: 2500},
        {name: 'Candy Bar', price: 1}]

      store.map{|product| store_greeting(product[:name], product[:price])}
    end

end
