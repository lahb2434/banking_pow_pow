class Card < ApplicationRecord
    belongs_to :card_owner, polymorphic: true
end
