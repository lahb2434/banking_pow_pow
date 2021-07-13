class Account < ApplicationRecord
    belongs_to :user
    has_many :cards, as: :card_owner
    has_many :merchandises, as: :owner
end
