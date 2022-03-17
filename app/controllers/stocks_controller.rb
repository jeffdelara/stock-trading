class StocksController < ApplicationController
  def search
    if params[:stock].present? 
      @stock = Stock.new_lookup(params[:stock])
      # render json: @stock

      if @stock # if @stock is not nil, i-execute ito
        render 'users/portfolio'
      else
        flash[:alert] = "Please enter a valid symbol."
        redirect_to portfolio_path
      end
   else
      flash[:alert] = "Please enter a symbol."
      redirect_to portfolio_path
   end
  end
end
