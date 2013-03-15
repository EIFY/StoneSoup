require 'spec_helper'

describe "stocks/edit" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :ticker => "MyString"
    ))
  end

  it "renders the edit stock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do
      assert_select "input#stock_ticker[name=?]", "stock[ticker]"
    end
  end
end
