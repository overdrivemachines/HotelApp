class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /reservations/:reservation_id/transactions
  # GET /reservations/:reservation_id/transactions.json
  def index
    @reservation = Reservation.find(params[:reservation_id])
    @transactions = @reservation.transactions
    @transaction = Transaction.new
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    # TODO: connect with stripe    
    # @transaction = Transaction.new(transaction_params)
    cc_number = params[:cc_number]
    cc_amount = params[:cc_amount].to_f

    @transaction = Transaction.new
    @transaction.reservation_id = params[:reservation_id]

    @transaction.description = "Payment Using Card " + cc_number.reverse[0..3].reverse
    @transaction.amount = cc_amount

    if @transaction.save
      redirect_to @transaction
    else
      render :index
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:reservation_id, :description, :amount)
    end
end
