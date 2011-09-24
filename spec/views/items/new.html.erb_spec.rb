require 'spec_helper'

describe "items/new.html.erb" do
  before(:each) do
    assign(:item, stub_model(Item,
      :user_id => 1,
      :name => "MyString",
      :description => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :image_id => 1,
      :rarity => 1
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path, :method => "post" do
      assert_select "input#item_user_id", :name => "item[user_id]"
      assert_select "input#item_name", :name => "item[name]"
      assert_select "textarea#item_description", :name => "item[description]"
      assert_select "input#item_latitude", :name => "item[latitude]"
      assert_select "input#item_longitude", :name => "item[longitude]"
      assert_select "input#item_image_id", :name => "item[image_id]"
      assert_select "input#item_rarity", :name => "item[rarity]"
    end
  end
end
