require 'test_helper'

class CallDefinationsControllerTest < ActionController::TestCase
  setup do
    @call_defination = call_definations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:call_definations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create call_defination" do
    assert_difference('CallDefination.count') do
      post :create, call_defination: @call_defination.attributes
    end

    assert_redirected_to call_defination_path(assigns(:call_defination))
  end

  test "should show call_defination" do
    get :show, id: @call_defination.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @call_defination.to_param
    assert_response :success
  end

  test "should update call_defination" do
    put :update, id: @call_defination.to_param, call_defination: @call_defination.attributes
    assert_redirected_to call_defination_path(assigns(:call_defination))
  end

  test "should destroy call_defination" do
    assert_difference('CallDefination.count', -1) do
      delete :destroy, id: @call_defination.to_param
    end

    assert_redirected_to call_definations_path
  end
end
