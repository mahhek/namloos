require 'test_helper'

class SellerRatesControllerTest < ActionController::TestCase
  setup do
    @seller_rate = seller_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_rate" do
    assert_difference('SellerRate.count') do
      post :create, seller_rate: @seller_rate.attributes
    end

    assert_redirected_to seller_rate_path(assigns(:seller_rate))
  end

  test "should show seller_rate" do
    get :show, id: @seller_rate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller_rate.to_param
    assert_response :success
  end

  test "should update seller_rate" do
    put :update, id: @seller_rate.to_param, seller_rate: @seller_rate.attributes
    assert_redirected_to seller_rate_path(assigns(:seller_rate))
  end

  test "should destroy seller_rate" do
    assert_difference('SellerRate.count', -1) do
      delete :destroy, id: @seller_rate.to_param
    end

    assert_redirected_to seller_rates_path
  end
end
