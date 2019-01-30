class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  

  

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    @total_amounts = Account.sum(:amount)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    #if params[:debts].present?
      #array = params[:debts].split("__")
      #array.each do |aquitoy|
        #puts "recibi: " + aquitoy.to_s
      #end
    #end
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: "accounts/compra", pdf: 'compra' , orientation: 'Landscape', page_size: 'Letter'}
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.present?#update(account_params)

        #Search the actual amount of the student
        @studentAccount = Student.find(params[:student_id]).account.amount.to_f

        if params[:razon].present?
          @pago = params[:amount1].to_f
          @totalDebts = @pago + @studentAccount

        elsif params[:amount_array].present?
          @mensualidad = 0
          @totalDebts = 0
          #Search  discount
          @discount = Student.find(params[:student_id]).discount.to_f
          
          #Get de array of amount and sum the values
          @paramsDebts = params[:amount_array]
          @paramsDebts.each do |allDebts|

            debt = Debt.find(allDebts)

            if debt.name == "Mensualidad" && @discount.present?
              @mensualidad = debt.amount.abs
              puts "Mensualidad #{@mensualidad}"
              #if promedio es => 9 discount + 10
              @mensualidad = (@discount / 100) * @mensualidad
              puts "#{debt.name} #{@mensualidad}"

            elsif Date.today.wday <= 17 || Date.today.wday >= 1
              @mensualidad = (@discount / 100) * @mensualidad
            end

            @totalDebts = (@totalDebts + debt.amount.abs - @mensualidad)
            puts "@totalDebts #{@totalDebts}"
          end

          @totalDebts = @totalDebts + @studentAccount
        end

        #Save record of payments
        @recordpayment = Recordpayment.new
        @recordpayment.amount = @totalDebts
        @recordpayment.user_name = current_user.last_name
        @recordpayment.save

        puts "***Account actualizado****" if @account.update(amount: @totalDebts)

        if params[:razon].present?
          format.html { redirect_to "/accounts/#{params[:ac_id]}?debts=#{@totalDebts}&razon=#{params[:razon]}"}
        else
          format.html { redirect_to "/accounts/#{params[:ac_id]}?debts=#{params[:amount_array].join("__")}" }
        end
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:amount,:student_id,:amount2)
    end
end
