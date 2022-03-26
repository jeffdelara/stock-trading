class QuotesController < ApplicationController
  
  def index
    if params[:symbol].present?
      redirect_to quote_path(params[:symbol].upcase) 
    else 
      redirect_to stocks_path 
    end
  end

  def show 
    @quote = Stock.new_lookup(params[:symbol].upcase)
    
    unless @quote
      flash[:alert] = 'Stock not found.'
      render :new 
    end
  end 
  
  def new 
    @quote = Quote.new
  end 

end
