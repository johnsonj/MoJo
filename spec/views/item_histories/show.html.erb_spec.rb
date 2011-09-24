require 'spec_helper'

describe "item_histories/show.html.erb" do
  before(:each) do
    @item_history = assign(:item_history, stub_model(ItemHistory,
      :user_id => 1,
      :item_id => 1,
      :latitude => 1.5,
      :longitude => 1.5,
      :signature => "Signature",
      :runningdistance => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Signature/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
