class Student < ApplicationRecord
  #after_create :save_account

  belongs_to :group
  has_many :subjects
  has_one :account, dependent: :delete
  has_many :debts
  has_many :subjectscores

  def save_account(student)
    Si funciono
  end
  def name_lastname
    "#{name} #{lastname}"
  end
end
