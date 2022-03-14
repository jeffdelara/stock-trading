class Stock < ApplicationRecord

  # self. does not need to depend on an instance variable
  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:iex_publishable],
      secret_token: Rails.application.credentials.iex_client[:iex_secret],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    quote = client.quote(ticker)
    quote.latest_price
  end
end
