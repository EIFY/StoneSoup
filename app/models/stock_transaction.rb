class StockTransaction < ActiveRecord::Base
  attr_accessible :shares, :type, :value
end
