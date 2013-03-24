class StockTransaction < ActiveRecord::Base
  attr_accessible :shares, :type, :value
  
  belongs_to :user
  belongs_to :stock
end
