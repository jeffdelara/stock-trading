class ApplicationController < ActionController::Base

  before_action :authenticate_user!



  def after_sign_in_path_for resource
    return admin_path if current_user.admin?
    return portfolio_path if current_user.trader?
  end

end
