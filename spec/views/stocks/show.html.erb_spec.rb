require 'spec_helper'

describe "stocks/show" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :ticker => "Ticker"
    ))
  end

  it "doesn't render attributes in <p>" do
    
    pending "currently spits out YahooFinance data"
    
    render
    rendered.should not_match(/Ticker/)
  end
end
