class User < ApplicationRecord
    has_secure_password
    has_many :accounts
    has_many :cards, through: :accounts
    has_many :credit_cards, class_name: :Card, as: :owner
    has_many :owned_merch, class_name: :Merchandise, as: :owner
    has_many :merchandises, through: :accounts
end
