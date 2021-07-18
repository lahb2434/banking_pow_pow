class Merchandise < ApplicationRecord
  belongs_to :user, optional: true
  validates :user , presence: true, unless: :owner 
  belongs_to :account, -> { Account.loans }, optional: true 
  validates :account , presence: true, unless: :owner
  belongs_to :owner, polymorphic: true, optional: true 
  validates :owner, presence: true, unless: :user && :account
end
