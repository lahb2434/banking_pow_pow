class Account < ApplicationRecord
    belongs_to :user, optional: true 
    validates_presence_of :user, if: :user_id_present?

    has_many :cards, as: :card_owner

    has_many :merchandises
    has_many :users, through: :merchandises
    
    scope :loans, -> { where(name: :loan) }
    scope :saving_and_checking, -> { where('name = ? or name = ?', 'checking', 'savings')}
    scope :added_up, lambda { where("name = ?", 'loan').sum(:balance)}

    private
      def user_id_present?
        user_id.present?
      end
end
