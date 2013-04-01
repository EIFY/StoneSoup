class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      
      UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      
      redirect_to root_url, :notice => "Welcome!"
    else
      render "new"
    end
  end
  
  def show
    @user = current_user
  end
  
  def transaction
    
    ticker = params[:symbol].upcase
    
    stock = Stock.find_or_create_by_ticker(ticker)
    
    number_of_shares = BigDecimal.new(params[:shares])
    
    if !stock.valid?
      
      flash[:notice] = "Unknown symbol!"
    
    elsif number_of_shares <= 0
      
      flash[:notice] = "Number of shares can't be zero or negative!"
      
    elsif params[:buy]
        
      current_user.buy_stock(stock.id, number_of_shares)
      
    elsif params[:sell]
      
      begin
      
        current_user.sell_stock(stock.id, number_of_shares)
        
      rescue Exception => e
        
        flash[:notice] = e.message
        
      end
      
    end
    
    redirect_to user_path(current_user)
    
  end
  
end