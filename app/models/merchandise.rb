class Merchandise < ApplicationRecord
    belongs_to :owner, polymorphic: true
end
