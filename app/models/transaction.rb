class Transaction < ApplicationRecord

  belongs_to :user
  belongs_to :transaction_type



  def self.record stock, type
    Transaction.create(
      :symbol => stock.symbol, 
      :company_name => stock.company_name, 
      :shares => stock.transact_shares, 
      :price => stock.cost_price, 
      :value => (stock.cost_price * stock.transact_shares).round(2), 
      :transaction_type => TransactionType.find_by_name(type.downcase), 
      :user_id => stock.user_id
    )
  end

end
