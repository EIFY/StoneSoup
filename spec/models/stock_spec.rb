require 'spec_helper'

RSpec.configure do |config|
  config.mock_with :rspec
end

describe Stock do
  it "reflects the price given by YahooFinance" do
    
    #YahooFinance::StandardQuote.any_instance.stub(:lastTrade).and_return(1.0)
    nil.stub(:lastTrade).and_return(1.0)
    
    #Doesn't work either way...put on back burner.
    
    s = Stock.create(:ticker => nil)
    
    s.price.should eq(1.0)
    
  end
end
