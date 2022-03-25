class SellStocksController < ApplicationController

  def show 
    @quote = Stock.new_lookup(params[:symbol].upcase)
  end

  def create
    # puts 'test'
    # puts stock_params
    @stock = current_user.stocks.find_by_symbol params[:symbol]

    # puts @stock
    # puts params[:symbol]
    # puts @stock.shares
    # puts stock_params[:shares].to_f
    # puts stock_params[:shares].to_f >= @stock.shares

    if stock_params[:shares].to_f > @stock.shares 
      flash[:alert] = "You only have #{@stock.shares} of #{@stock.company_name} to sell."
      redirect_to get_sellstock_path(params[:symbol])
    else
      # if @stock 
        @stock.update(
          :shares => @stock.shares - stock_params[:shares].to_f
        )
      # else
      #   @stock.save
      
      redirect_to portfolio_path, notice: "Successfully sold #{stock_params[:shares]} shares of #{@stock.company_name}!"
    end
      
  end

  private
  def stock_params
    params.require(:stock).permit(:symbol, :company_name, :shares, :cost_price, :user_id)
  end
end
