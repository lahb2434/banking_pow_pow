class User < ApplicationRecord
    has_secure_password

    devise :omniauthable, omniauth_providers: %i[facebook]

    has_many :accounts, -> {  Account.saving_and_checking } #for encapsulation
    
    has_many :cards, through: :accounts

    has_many :credit_cards, class_name: :Card, as: :card_owner
    has_many :owned_merch, class_name: :Merchandise, as: :owner

    has_many :merchandises  
    has_many :loans, through: :merchandises, source: :account

    validates :first_name, 
    presence: true, 
    presence: { case_sensitive: false }

    validates :last_name, 
    presence: true, 
    presence: { case_sensitive: false }

    validates :email, 
    format: { with: URI::MailTo::EMAIL_REGEXP } 

    validate :age

    validates :user_name, 
    presence: true, 
    uniqueness: true

    PASSWORD_FORMAT = /\A
      (?=.{8,})          # Must contain 8 or more characters
      (?=.*\d)           # Must contain a digit
      (?=.*[a-z])        # Must contain a lower case character
      (?=.*[A-Z])        # Must contain an upper case character
      (?=.*[[:^alnum:]]) # Must contain a symbol
      /x

    validates :password, 
    presence: true, 
    format: { with: PASSWORD_FORMAT, 
    message: <<-ERR
    Password must contain at minimum 8 characters in length, 
    a capital letter, a lowercase letter, 
    a number, and a special character 
    i.e. ! @ # $ % 
    ERR
    }

    private
  
    def age
        if birth_date.present? && birth_date > 18.years.ago
            errors.add(:birth_date, '- only 18 years and older can Register.')
        end
    end
end