require 'test_helper'

class CallgroupsControllerTest < ActionController::TestCase
  setup do
    @callgroup = callgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:callgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create callgroup" do
    assert_difference('Callgroup.count') do
      post :create, callgroup: @callgroup.attributes
    end

    assert_redirected_to callgroup_path(assigns(:callgroup))
  end

  test "should show callgroup" do
    get :show, id: @callgroup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @callgroup.to_param
    assert_response :success
  end

  test "should update callgroup" do
    put :update, id: @callgroup.to_param, callgroup: @callgroup.attributes
    assert_redirected_to callgroup_path(assigns(:callgroup))
  end

  test "should destroy callgroup" do
    assert_difference('Callgroup.count', -1) do
      delete :destroy, id: @callgroup.to_param
    end

    assert_redirected_to callgroups_path
  end
end
