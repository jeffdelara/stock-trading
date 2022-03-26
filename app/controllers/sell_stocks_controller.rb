class SellStocksController < ApplicationController

  def show 
    symbol = params[:symbol].upcase
    @quote = Stock.new_lookup symbol 
    @stock = current_user.stocks.find_by_symbol symbol 
  end

  def create
    @stock = current_user.stocks.find_by_symbol params[:symbol]

    if stock_params[:shares].to_f > @stock.shares 
      flash[:alert] = 
        "You only have #{@stock.shares} of #{@stock.company_name} to sell."
      redirect_to get_sellstock_path(params[:symbol])
    else
      sold_shares = stock_params[:shares]
      @stock.update :shares => @stock.shares - stock_params[:shares].to_f
      
      @stock.shares = sold_shares
      Transaction.record @stock, 'sell'
      redirect_to portfolio_path, notice: "Successfully sold #{stock_params[:shares]} shares of #{@stock.company_name}!"
    end
      
  end

  private
  def stock_params
    params.require(:stock).permit(:symbol, :company_name, :shares, :cost_price, :user_id)
  end
end
