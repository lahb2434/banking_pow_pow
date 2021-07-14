class Merchandise < ApplicationRecord
    belongs_to :user
    belongs_to :account, -> { Account.loans }
    belongs_to :owner, polymorphic: true
    
end
