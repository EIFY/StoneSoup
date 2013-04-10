require 'spec_helper'

RSpec.configure do |config|
  config.mock_with :rspec
end

describe Stock do
  it "reflects the price given by YahooFinance" do
    
    #YahooFinance::StandardQuote.any_instance.stub(:lastTrade).and_return(1.0)
    #Doesn't work...put on back burner.
    
    allow_message_expectations_on_nil
    
    nil.stub(:lastTrade).and_return(1.0)
    
    s = Stock.create(:ticker => nil)
    
    s.price.should eq(1.0)
    
  end
end
