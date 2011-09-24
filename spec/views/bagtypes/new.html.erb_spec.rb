require 'spec_helper'

describe "bagtypes/new.html.erb" do
  before(:each) do
    assign(:bagtype, stub_model(Bagtype,
      :size => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new bagtype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bagtypes_path, :method => "post" do
      assert_select "input#bagtype_size", :name => "bagtype[size]"
      assert_select "input#bagtype_name", :name => "bagtype[name]"
    end
  end
end
