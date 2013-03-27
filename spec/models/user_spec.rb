require 'spec_helper'

RSpec.configure do |config|
  config.mock_with :rspec
end

describe User do
  it "correctly buys new stocks" do
    
    user = FactoryGirl.create(:user)
    stock = FactoryGirl.create(:stock)
    
    user.buy_stock(stock.id, 1.0)
    
    holding = user.stock_holdings.find_by_stock_id(1)
    
    holding.shares.should eq(1.0)
    
  end
  
  it "correctly buys stocks he/she already holds" do
    
    user = FactoryGirl.create(:user)
    stock = FactoryGirl.create(:stock)
    
    user.buy_stock(stock.id, 1.0)
    user.buy_stock(stock.id, 1.0)
    
    holding = user.stock_holdings.find_by_stock_id(1)
    
    holding.shares.should eq(2.0)
    
  end
  
end
