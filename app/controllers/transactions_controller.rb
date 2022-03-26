class TransactionsController < ApplicationController
  
  def index
    @transactions = current_user.transactions.order(:created_at => :DESC)
  end

  private
  def transactions_params
    params.require(:transactions).permit(:symbol, :company_name, :shares, :price, :value)
  end
end
