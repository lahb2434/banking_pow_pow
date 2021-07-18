class MerchandiseController < ApplicationController
    

    def store
        @merchandise = Merchandise.new
    end

    def create
        byebug
    end
    

end
