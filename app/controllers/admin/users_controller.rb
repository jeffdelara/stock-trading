class Admin::UsersController < ApplicationController

  before_action :require_admin
  before_action :set_user, :only => [:show, :edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def show 
    
  end

  def new 
    @user = User.new
  end 

  def create 
    @user = User.new(allowed_params)
    @user.confirmed_at = Time.now 
    
    if @user.save 
      redirect_to new_admin_user_path, :notice => 'Account success!'
    else 
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end



  private

  def allowed_params 
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def require_admin 
    redirect_to root_path unless current_user.admin?
  end

  def set_user 
    @user = User.find params[:id]
  end

end
