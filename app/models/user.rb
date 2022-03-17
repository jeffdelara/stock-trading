class User < ApplicationRecord

  # Associations
  has_many :user_stock_portfolios
  has_many :stocks, through: :user_stock_portfolios

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 

  # define roles
  enum role: [:trader, :admin]

  # after creating a new account, set account to default role
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :trader
  end

  def admin? 
    self.role == 'admin'
  end

  def trader? 
    self.role == 'trader'
  end
end 
