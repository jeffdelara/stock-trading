class Admin::PendingTradersController < ApplicationController
  def index
    @users = User.where(:approved => false, :role => :trader)
  end
end
