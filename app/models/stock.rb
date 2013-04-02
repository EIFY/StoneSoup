require "bigdecimal"

class TickerValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    
    quote = YahooFinance::get_standard_quotes(value)[value]
    
    unless quote and quote.valid?
      record.errors[attribute] << (options[:message] || "is not a valid ticker")
    end
    
  end
end

class Stock < ActiveRecord::Base
  attr_accessible :ticker
  
  validates :ticker, :ticker => true
  
  has_many :stock_holdings
  has_many :stock_transactions
  
  def price
    
    quote = YahooFinance::get_standard_quotes(self.ticker)[self.ticker]
    
    # Unfortunately lastTrade returns float... roundabout temp. measure for now.
    
    BigDecimal.new(quote.lastTrade.to_s)
    
  end
  
end