class Student < ApplicationRecord
  #after_create :save_account

  belongs_to :group, optional: true
  has_many :studentsubjects
  has_many :subjects, through: :studentsubjects
  has_one :account, dependent: :delete
  has_many :debts
  has_many :subjectscores

  def name_lastname
    "#{name} #{lastname}"
  end
end
