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
      @scores = []
      @scores_comparation = []
      @tmp = 0
      Studentsubject.where("student_id = ?", estudian.id).each do |relation|
        #puts  "Relation #{relation.student_id}"
        #puts "Estudian #{estudian.id}"
        #@subjectid = relation.subject_id
        @materia = Subject.find(relation.subject_id).name
        @scores_comparation << @materia

        if relation.firstsmodulescore.to_f > 0 and relation.secondmodulescore.to_f > 0
        
          @scores << @materia
          @tmp = relation.firstsmodulescore.to_f + relation.secondmodulescore.to_f
          #@tmp.sum(relation.secondmodulescore)
          puts @tmp
          #puts @scores << @tmp
      end
      puts "Cantidad #{@scores.size}"
      if @scores.size == @scores_comparation.size
        estudian.average = @tmp
        estudian.reload
    end

    
  end



end
