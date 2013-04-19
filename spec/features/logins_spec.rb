require 'spec_helper'

describe "User" do
  
  before(:each) do
    
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Login"
    
  end
  
  it "log in valid users" do

    page.should have_content("Logged in as")
    
  end
  
  it "buys new stock correctly" do
    
    user = FactoryGirl.create(:user)
    stock = FactoryGirl.create(:stock)
    
    visit stock_path(stock.id)
    
    fill_in "Shares", :with => '1.0'
    click_button "Buy"
    page.should have_content('1.0')
    page.should have_content("1.0 shares of #{stock.ticker} bought")
    
  end
  
end