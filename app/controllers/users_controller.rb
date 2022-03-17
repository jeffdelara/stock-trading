class UsersController < ApplicationController
  def portfolio
    @my_stocks = current_user.stocks 
  end
end
