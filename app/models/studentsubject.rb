class Studentsubject < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  belongs_to :user

  def name_lastname
    "#{name} #{lastname}"
  end
end
