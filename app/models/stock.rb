class Stock < ApplicationRecord

  belongs_to :user


  # Validations
  validates :symbol, :company_name, presence: true

  # self. does not need to depend on an instance variable (@)
  def self.new_lookup(symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:iex_publishable],
      secret_token: Rails.application.credentials.iex_client[:iex_secret],
      endpoint: 'https://cloud.iexapis.com/v1'
    )

    begin 
      # for valid symbols
      new(  symbol: symbol,
            company_name: client.company(symbol).company_name,
            cost_price: client.quote(symbol).latest_price)
      # quote = client.quote(symbol)
      # quote.latest_price

      # if we find no data in the API, we get an exception, we rescue or just return nil
      rescue => exception
        return nil
    end
  end

  def self.check_stocks(symbol)
    where(symbol: symbol).first
  end
  
end
