class Student < ApplicationRecord
  #after_create :save_account

  belongs_to :group
  has_many :subjects
  has_one :account, dependent: :delete
  has_many :debts

  def save_account(student)
    Si funciono
  end
end
