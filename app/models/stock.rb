class Stock < ActiveRecord::Base
  attr_accessible :ticker
  
  #before_validation :upcase_ticker
  
  #def upcase_ticker
  #  self.ticker.upcase!
  #end
end
