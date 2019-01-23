class RecordpaymentsController < ApplicationController
  before_action :set_recordpayment, only: [:show, :edit, :update, :destroy]

  # GET /recordpayments
  # GET /recordpayments.json
  def index
    @recordpayments = Recordpayment.all
    
    if params[:delete_records].present?
      @recordpayments.delete_all
    end
  end

  # GET /recordpayments/1
  # GET /recordpayments/1.json
  def show
  end

  # GET /recordpayments/new
  def new
    @recordpayment = Recordpayment.new
  end

  # GET /recordpayments/1/edit
  def edit
  end

  # POST /recordpayments
  # POST /recordpayments.json
  def create
    @recordpayment = Recordpayment.new(recordpayment_params)

    respond_to do |format|
      if @recordpayment.save
        format.html { redirect_to @recordpayment, notice: 'Recordpayment was successfully created.' }
        format.json { render :show, status: :created, location: @recordpayment }
      else
        format.html { render :new }
        format.json { render json: @recordpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordpayments/1
  # PATCH/PUT /recordpayments/1.json
  def update
    respond_to do |format|
      if @recordpayment.update(recordpayment_params)
        format.html { redirect_to @recordpayment, notice: 'Recordpayment was successfully updated.' }
        format.json { render :show, status: :ok, location: @recordpayment }
      else
        format.html { render :edit }
        format.json { render json: @recordpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordpayments/1
  # DELETE /recordpayments/1.json
  def destroy
    @recordpayment.destroy
    respond_to do |format|
      format.html { redirect_to recordpayments_url, notice: 'Recordpayment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recordpayment
      @recordpayment = Recordpayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recordpayment_params
      params.require(:recordpayment).permit(:user_id, :amount, :debt_id)
    end
end
