class Admin::TransactionsController < ApplicationController

  def index 
    @transactions = Transaction.includes(:transaction_type, :user).all 
  end

end
