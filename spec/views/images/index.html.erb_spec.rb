require 'spec_helper'

describe "images/index.html.erb" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :image => ""
      ),
      stub_model(Image,
        :image => ""
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
