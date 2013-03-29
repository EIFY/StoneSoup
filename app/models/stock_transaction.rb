class StockTransaction < ActiveRecord::Base
  attr_accessible :user_id, :stock_id, :shares, :transaction_type, :value
  
  belongs_to :user
  belongs_to :stock
end
