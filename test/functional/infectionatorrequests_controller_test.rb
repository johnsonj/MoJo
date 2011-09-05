require 'test_helper'

class InfectionatorrequestsControllerTest < ActionController::TestCase
  setup do
    @infectionatorrequest = infectionatorrequests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infectionatorrequests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infectionatorrequest" do
    assert_difference('Infectionatorrequest.count') do
      post :create, :infectionatorrequest => @infectionatorrequest.attributes
    end

    assert_redirected_to infectionatorrequest_path(assigns(:infectionatorrequest))
  end

  test "should show infectionatorrequest" do
    get :show, :id => @infectionatorrequest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @infectionatorrequest.to_param
    assert_response :success
  end

  test "should update infectionatorrequest" do
    put :update, :id => @infectionatorrequest.to_param, :infectionatorrequest => @infectionatorrequest.attributes
    assert_redirected_to infectionatorrequest_path(assigns(:infectionatorrequest))
  end

  test "should destroy infectionatorrequest" do
    assert_difference('Infectionatorrequest.count', -1) do
      delete :destroy, :id => @infectionatorrequest.to_param
    end

    assert_redirected_to infectionatorrequests_path
  end
end
