class Account < ApplicationRecord
    belongs_to :user
    has_many :cards
    has_many :merchandises, as: :owner
end
