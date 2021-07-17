module ApplicationHelper

    def formatted_balance(number)
      num = number_with_precision(number, precision: 2)
      number_with_delimiter(num, delimiter: ',')
    end

end
