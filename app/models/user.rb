class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\..+/i
  
  has_many :stock_holdings
  has_many :stock_transactions
  
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  def buy_stock(stock_id, shares)
    
    StockTransaction.create(:user_id => self.id, :stock_id => stock_id, :transaction_type => 'buy', :shares => shares, :value => Stock.find(stock_id).price * shares)
    
    holding = self.stock_holdings.find_by_stock_id(stock_id)
    
    if holding
      
      holding.shares += shares
      holding.save
      
    else
      
      StockHolding.create(:user_id => self.id, :stock_id => stock_id, :shares => shares)
      
    end
    
  end

  def sell_stock(stock_id, shares)
    
    holding = self.stock_holdings.find_by_stock_id(stock_id)
    
    if !holding
      
      raise "You don't have this stock!"
      
    elsif (updated_number_of_shares = holding.shares - shares) < 0
      
      raise "Insufficient shares!"
      
    else
      
      value = Stock.find(stock_id).price * shares
      
      StockTransaction.create(:user_id => self.id, :stock_id => stock_id, :transaction_type => 'sell', :shares => shares, :value => value)
      
      if updated_number_of_shares == 0 then holding.delete else holding.update_attribute(:shares, updated_number_of_shares) end
      
    end
    
  end

end