class Debt < ApplicationRecord
    belongs_to :student, optional: true
    has_many :recordpayments
end
