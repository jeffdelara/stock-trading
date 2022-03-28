class User < ApplicationRecord

  has_many :stocks
  has_many :transactions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 

  validates :email, presence: true
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

  def buy_stock symbol, shares
    stock = self.stocks.build :symbol => symbol, :shares => shares
    stock_portfolio = self.stocks.find_by_symbol symbol.upcase

    if stock_portfolio 
      stock_portfolio.update(
        :shares => stock_portfolio.shares + shares
      )
      
      stock_portfolio.transact_shares = shares 
      return stock_portfolio
    else 
      stock.transact_shares = shares
      stock.save
    end
    return stock
  end

  def sell_stock symbol, shares 
    stock = self.stocks.find_by_symbol symbol
    sold_shares = shares

    if sold_shares > stock.shares 
      flash[:alert] = 
        "You only have #{stock.shares} of #{stock.company_name} to sell."
      return nil
    else
      stock.update :shares => (stock.shares - sold_shares)
      stock.transact_shares = sold_shares
      return stock 
    end
  end


end 
