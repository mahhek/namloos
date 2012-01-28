require 'test_helper'

class ApplyTosControllerTest < ActionController::TestCase
  setup do
    @apply_to = apply_tos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apply_tos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apply_to" do
    assert_difference('ApplyTo.count') do
      post :create, apply_to: @apply_to.attributes
    end

    assert_redirected_to apply_to_path(assigns(:apply_to))
  end

  test "should show apply_to" do
    get :show, id: @apply_to.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apply_to.to_param
    assert_response :success
  end

  test "should update apply_to" do
    put :update, id: @apply_to.to_param, apply_to: @apply_to.attributes
    assert_redirected_to apply_to_path(assigns(:apply_to))
  end

  test "should destroy apply_to" do
    assert_difference('ApplyTo.count', -1) do
      delete :destroy, id: @apply_to.to_param
    end

    assert_redirected_to apply_tos_path
  end
end
