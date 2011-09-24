require 'spec_helper'

describe "item_histories/index.html.erb" do
  before(:each) do
    assign(:item_histories, [
      stub_model(ItemHistory,
        :user_id => 1,
        :item_id => 1,
        :latitude => 1.5,
        :longitude => 1.5,
        :signature => "Signature",
        :runningdistance => ""
      ),
      stub_model(ItemHistory,
        :user_id => 1,
        :item_id => 1,
        :latitude => 1.5,
        :longitude => 1.5,
        :signature => "Signature",
        :runningdistance => ""
      )
    ])
  end

  it "renders a list of item_histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Signature".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
