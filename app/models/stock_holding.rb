class StockHolding < ActiveRecord::Base
  attr_accessible :shares
  
  belongs_to :user
  belongs_to :stock
end
