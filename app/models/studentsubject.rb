class Studentsubject < ApplicationRecord
  after_update :promedio

  belongs_to :subject
  belongs_to :student
  belongs_to :user

  def name_lastname
    "#{name} #{lastname}"
  end

  def promedio
    #@student_subject = Studentsubject.all
    @estudiante = Student.all
    #puts User.current_user.id

    @estudiante.each do |estudian|
      puts "Estudiante #{estudian.name} #{estudian.lastname}"
      @scores =[]
      Studentsubject.where("student_id = ?", estudian.id).each do |relation|
        #puts  "Relation #{relation.student_id}"
        #puts "Estudian #{estudian.id}"
        #@subjectid = relation.subject_id
        #puts Subject.find(relation.subject_id).name
        #puts "Firstmodule #{relation.firstsmodulescore}"
        #puts "Secondtmodule #{relation.secondmodulescore}"
        @tmp = 0
        @tmp = relation.firstsmodulescore #+ relation.secondmodulescore
        @tmp = @tmp + relation.secondmodulescore
        #puts @scores << @tmp
      end
    end

    
  end



end
