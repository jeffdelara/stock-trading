require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User management' do 
    it 'can create a user' do 
      user = User.new(
        :email => 'jeff@test.com', 
        :password => 'abc123'
      )

      expect(user.valid?).to eq(true)
    end

    it 'can delete a user' do 
      initial = User.all.count
      user = User.create!(:email => 'jeff@test.com', :password => 'abc123')
      user.destroy 
      destroyed = User.all.count
      expect(destroyed).to eq(initial) 
    end

    it 'user must be unapproved on first create and make trader as default' do 
      user = User.create!(:email => 'jeff@test.com', :password => 'abc123')
      expect(user.approved?).to eq(false)
      expect(user.trader?).to eq(true)
    end
  end

  context 'User trading' do 
    it 'can buy stocks' do 
      user = User.create!(
        :email => 'jeff@test.com', 
        :password => 'abc123', 
        :approved => true
      )

      stock = user.buy_stock('AAPL', 10)
      expect(stock.shares).to eq(10)
    end
  end
end
