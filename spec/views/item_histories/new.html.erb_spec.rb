require 'spec_helper'

describe "item_histories/new.html.erb" do
  before(:each) do
    assign(:item_history, stub_model(ItemHistory,
      :user_id => 1,
      :item_id => 1,
      :latitude => 1.5,
      :longitude => 1.5,
      :signature => "MyString",
      :runningdistance => ""
    ).as_new_record)
  end

  it "renders new item_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => item_histories_path, :method => "post" do
      assert_select "input#item_history_user_id", :name => "item_history[user_id]"
      assert_select "input#item_history_item_id", :name => "item_history[item_id]"
      assert_select "input#item_history_latitude", :name => "item_history[latitude]"
      assert_select "input#item_history_longitude", :name => "item_history[longitude]"
      assert_select "input#item_history_signature", :name => "item_history[signature]"
      assert_select "input#item_history_runningdistance", :name => "item_history[runningdistance]"
    end
  end
end
