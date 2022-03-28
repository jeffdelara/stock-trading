require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validating user email' do
    it 'is not valid without username' do
      user = described_class.new
      user.email = nil
    expect(user).not_to be_valid
    end
  end

  context 'validating user associations' do
    it "has many stocks" do
      should respond_to(:stocks)
    end

    it "has many transactions" do
      should respond_to(:transactions)
    end
  end
end
