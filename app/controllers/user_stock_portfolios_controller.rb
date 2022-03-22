class UserStockPortfoliosController < ApplicationController
  def create
    stock = Stock.check_stocks(params[:symbol])

    if stock.blank?
      @stock = Stock.new_lookup(params[:symbol]).save
    end

    @user_stock = UserStockPortfolio.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.company_name} was successfully bought."
    redirect_to portfolio_path
  end


end
