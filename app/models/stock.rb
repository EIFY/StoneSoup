class TickerValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    
    quote = YahooFinance::get_standard_quotes(value)[value]
    
    unless quote.valid?
      record.errors[attribute] << (options[:message] || "is not a valid ticker")
    end
    
  end
end

class Stock < ActiveRecord::Base
  attr_accessible :ticker
  
  validates :ticker, :ticker => true
end