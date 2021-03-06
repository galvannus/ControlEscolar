class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]


  load_and_authorize_resource 
  rescue_from CanCan::AccessDenied do |exception|
    flash.now[:notice] = "Usuario no Autorizado"
    redirect_to root_url
  end

  def assigment
    if params[:grupo].present?
      redirect_to "/asignar?asignar=#{3}"
      puts "**************************"
      puts params
      puts "**************************"
      if params[:student].present?  
        params[:student].each do |id_student|
          estudiante = Student.find(id_student)
          puts estudiante.name
          puts "Actualizado el grupo" if estudiante.update(group_id: params[:grupo])
        end
      end

    elsif params[:materia].present?
      redirect_to "/asignar?asignar=#{1}"
      puts "**************************"
      puts params
      puts "**************************"
      if params[:student].present?  
        params[:student].each do |id_student|
          @studentsubject = Studentsubject.new
          @studentsubject.student_id = id_student
          @studentsubject.subject_id = params[:materia]
          @studentsubject.save

          #@materia = Studentsubject.where("student_id = ? AND subject_id = ?", id_student, params[:materia])
          #puts @materia.ids
          #@subjectscore = Subjectscore.new
          #@subjectscore.student_id = id_student
          #@subjectscore.subject_id = params[:materia]
          #puts @subjectscore.save
          #@subjectscore.save
        end
      end
    elsif params[:semestre].present?
      redirect_to "/asignar?asignar=#{2}"
      params[:student].each do |id_student|
        estudiante = Student.find(id_student)
        puts "Actualizado el semestre" if estudiante.update(semester_id: params[:semestre])
      end
    end

  end
  
  def panelcontrol
    if params[:student].present?
      @estudiantes = Student.search(params[:student])
    end

    if params[:grupo].present?
      redirect_to "/panel"
      puts "**************************"
      puts params
      puts "**************************"
      if params[:student].present?  
        params[:student].each do |id_student|
          estudiante = Student.find(id_student)
          puts estudiante.name
          puts "Actualizado el grupo" if estudiante.update(group_id: params[:grupo])
        end
      end

    elsif params[:materia].present?
      redirect_to "/panel"
      puts "**************************"
      puts params
      puts "**************************"
      if params[:student].present?  
        params[:student].each do |id_student|
          @studentsubject = Studentsubject.new
          @studentsubject.student_id = id_student
          @studentsubject.subject_id = params[:materia]
          @studentsubject.user_id = params[:profesor]
          @studentsubject.save
        end
      end
    elsif params[:semestre].present?
      redirect_to "/panel"
      params[:student].each do |id_student|
        estudiante = Student.find(id_student)
        puts "Actualizado el semestre" if estudiante.update(semester_id: params[:semestre])
      end
    end
    
  end
  # GET /students
  # GET /students.json
  def index
    
    if params[:student].present?
      @students = Student.search(params[:student])
    elsif params[:group].present?
      @students = Student.searchgroup(params[:group])
    else
      @students = Student.all
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params) 

    respond_to do |format|
      if @student.save
        #Start
        #When register a new student
        #Save amount of account of student
        @account = Account.new
        @totaldebts = Debt.sum(:amount)
        @account.amount = @totaldebts
        @account.student_id = @student.id
        @account.save

        #Get the id of the account and save in the student
        @student.reload
        @student.account_id = @account.id
        @student.save
        #Finish

        format.html { redirect_to @student, notice: "Student #{@student.id} was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was #{@student.id} successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:group,:semester_id,:search, :discount, :group_id, :subject_id, :name, :lastname, :tel1, :tel2, :street, :numberhome, :suburb, :registrationnumber, :banknumber, :account_id)
    end
    def account_params
      params.require(:account).permit(:amount,:student_id)
    end
end
