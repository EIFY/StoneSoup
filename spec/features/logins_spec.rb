require 'spec_helper'

describe "Logins" do
  it "log in valid users" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Login"
    page.should have_content("Logged in as")
  end
end