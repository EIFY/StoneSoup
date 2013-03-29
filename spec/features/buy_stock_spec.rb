require 'spec_helper'

describe "Stock Purchase" do
  it "buys new stock correctly" do
    user = FactoryGirl.create(:user)
    stock = FactoryGirl.create(:stock)
    
    visit stock_path(stock.id)
    
    #save_and_open_page
    
    #Capybara can't see this field unless it's logged in!
    fill_in "Shares", :with => '1.0'
    click_button "Buy"
    page.should have_content('1.0')
  end
end