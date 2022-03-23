class QuotesController < ApplicationController
  
  def index 
    redirect_to stocks_path
  end

  def show 
  end 
  
  def new 
    @quote = Quote.new
  end 

  def create
    @quote = Stock.new_lookup(params[:symbol])
  end

end
