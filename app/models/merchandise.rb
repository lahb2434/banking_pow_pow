class Merchandise < ApplicationRecord
    belongs_to :user
    belongs_to :account, -> { Account.loans }
    belongs_to :owner, polymorphic: true, optional: true 
    validates_presence_of :owner, if: :owner_id_present?
    
    private

      def owner_id_present?
        owner_id.present?
      end
end
