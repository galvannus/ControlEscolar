class Debt < ApplicationRecord
    belongs_to :student
    has_many :recordpayments
end
