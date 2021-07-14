class Card < ApplicationRecord
    belongs_to :card_owner, polymorphic: true
    scope :added_up, lambda { where("card_type = ?", 'Credit').sum(:balance)}

end
