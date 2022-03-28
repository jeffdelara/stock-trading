require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'Stock quotes' do 
    it 'gets quotes from iex' do 
      quote = Stock.new_lookup('AAPL')
      expect(quote.symbol).to eq('AAPL')
    end
  end
end
