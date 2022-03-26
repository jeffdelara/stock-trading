class StaticPagesController < ApplicationController

  skip_before_action :authenticate_user!
  before_action :logged_in

  def home; end
  
  private 

  def logged_in
    return unless user_signed_in?
    redirect_to portfolio_path if current_user&.trader?
    redirect_to admin_path if current_user&.admin?
  end

end
