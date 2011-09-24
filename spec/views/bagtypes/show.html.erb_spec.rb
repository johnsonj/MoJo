require 'spec_helper'

describe "bagtypes/show.html.erb" do
  before(:each) do
    @bagtype = assign(:bagtype, stub_model(Bagtype,
      :size => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
