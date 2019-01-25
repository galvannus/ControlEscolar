class Student < ApplicationRecord
  #after_create :save_account

  belongs_to :group, optional: true
  has_many :studentsubjects
  has_many :subjects, through: :studentsubjects
  has_one :account, dependent: :delete
  has_many :debts
  belongs_to :semester
  #has_many :subjects, through: :subjectscores
  #has_many :subjectscores

  def name_lastname
    "#{name} #{lastname}"
  end

  def user_name_lastname
    "#{name} #{last_name}"
  end

  def self.search(student)
    if student
      where('lastname LIKE ?', "%#{student}%")
    #else
      #@estudiante = Student.all
    end
  end

end
