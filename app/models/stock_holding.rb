class StockHolding < ActiveRecord::Base
  attr_accessible :user_id, :stock_id, :shares
  
  belongs_to :user
  belongs_to :stock
end
