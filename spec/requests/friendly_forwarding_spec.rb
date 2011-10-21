require 'spec_helper'

describe "FriendlyForwarding" do

  it "should forward to the requested page after login" do
    user = Factory(:user)
    visit "/users/#{user.id}/edit"
    # The test automatically follows the redirect to the login page.
    fill_in :username,    :with => user.username
    fill_in :password, :with => user.password
    click_button
    # The test follows the redirect again, this time to users/edit.
    response.should render_template('users/edit')
  end
end