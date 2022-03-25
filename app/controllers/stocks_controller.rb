class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  def index
    @stocks = current_user.stocks.where.not(shares: 0)
    # @stocks.map{|stock| stock.shares == 0 && stock.destroy}
  end

  # GET /stocks/1
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  def create
    @stock = current_user.stocks.build stock_params
    stock_portfolio = current_user.stocks.find_by_symbol @stock.symbol 

    if stock_portfolio 
      stock_portfolio.update(
        :shares => stock_portfolio.shares + @stock.shares
      )
    else 
      @stock.save
    end
    redirect_to stocks_path, notice: 'Buy successful.'
  end

  # PATCH/PUT /stocks/1
  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:symbol, :company_name, :shares, :cost_price, :user_id)
    end
end
