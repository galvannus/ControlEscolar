class Recordpayment < ApplicationRecord
  belongs_to :user
  belongs_to :debt
end
