class Student < ApplicationRecord
  belongs_to :group
  has_many :subjects
  has_one :account
end
