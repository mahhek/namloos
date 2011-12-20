require 'test_helper'

class PrefixesControllerTest < ActionController::TestCase
  setup do
    @prefix = prefixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prefixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prefix" do
    assert_difference('Prefix.count') do
      post :create, prefix: @prefix.attributes
    end

    assert_redirected_to prefix_path(assigns(:prefix))
  end

  test "should show prefix" do
    get :show, id: @prefix.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prefix.to_param
    assert_response :success
  end

  test "should update prefix" do
    put :update, id: @prefix.to_param, prefix: @prefix.attributes
    assert_redirected_to prefix_path(assigns(:prefix))
  end

  test "should destroy prefix" do
    assert_difference('Prefix.count', -1) do
      delete :destroy, id: @prefix.to_param
    end

    assert_redirected_to prefixes_path
  end
end
