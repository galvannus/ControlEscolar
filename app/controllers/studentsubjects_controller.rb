class StudentsubjectsController < ApplicationController
  before_action :set_studentsubject, only: [:show, :edit, :update, :destroy]
  


  # GET /studentsubjects
  # GET /studentsubjects.json
  def index
    @studentsubjects = Studentsubject.all
  end

  # GET /studentsubjects/1
  # GET /studentsubjects/1.json
  def show
  end

  # GET /studentsubjects/new
  def new
    @studentsubject = Studentsubject.new
  end

  # GET /studentsubjects/1/edit
  def edit
  end

  # POST /studentsubjects
  # POST /studentsubjects.json
  def create
    @studentsubject = Studentsubject.new(studentsubject_params)

    respond_to do |format|
      if @studentsubject.save
        format.html { redirect_to @studentsubject, notice: 'Studentsubject was successfully created.' }
        format.json { render :show, status: :created, location: @studentsubject }
      else
        format.html { render :new }
        format.json { render json: @studentsubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studentsubjects/1
  # PATCH/PUT /studentsubjects/1.json
  def update
    respond_to do |format|
      if @studentsubject.update(studentsubject_params)
        #if @studentsubject.firstsmodulescore.present? and @studentsubject.secondmodulescore.present?
          #puts "Promedio"
        #end
        format.html { redirect_to @studentsubject, notice: 'Studentsubject was successfully updated.' }
        format.json { render :show, status: :ok, location: @studentsubject }
      else
        format.html { render :edit }
        format.json { render json: @studentsubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studentsubjects/1
  # DELETE /studentsubjects/1.json
  def destroy
    @studentsubject.destroy
    respond_to do |format|
      format.html { redirect_to studentsubjects_url, notice: 'Studentsubject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studentsubject
      @studentsubject = Studentsubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studentsubject_params
      params.require(:studentsubject).permit(:secondmodulescore, :firstsmodulescore, :subject_id, :student_id)
    end
end
