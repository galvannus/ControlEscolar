class Student < ApplicationRecord
 

  belongs_to :group, optional: true
  has_many :studentsubjects
  has_many :subjects, through: :studentsubjects
  has_one :account, dependent: :delete
  has_many :debts
  belongs_to :semester, optional: true
  

  def name_lastname
    "#{name} #{lastname}"
  end

  def self.search(student)
    if student
      where('lastname LIKE ?', "%#{student}%")
    end
  end

  def self.searchgroup(group)
    @grupo = Group.where("name = ?", group)
    @grupoH = 0 
    @grupo.ids.each do |hello|
      @grupoH = hello
    end
    
    if group
      where('group_id LIKE ?', "%#{@grupoH}%")
    end
  end

end
