class UserMailer < ApplicationMailer 
  default from: 'groupjeffals@gmail.com'

  def welcome_email 
    # delivery_options = {
    #   :api_key    => Rails.application.credentials.mailjet_api_key,
    #   :secret_key => Rails.application.credentials.mailjet_secret_key, 
    #   :version    => 'v3.1'
    # }

    @user = params[:user]
    
    mail(
      :to => @user.email, 
      :subject => 'Account Approved!'
      # :delivery_method_options => delivery_options
    )
  end
  
end
