class UserMailer < ApplicationMailer 
  default from: 'groupjeffals@gmail.com'

  def welcome_email 
    @user = params[:user]
    
    mail :to => @user.email, :subject => 'Account Approved!'
  end
  
end
