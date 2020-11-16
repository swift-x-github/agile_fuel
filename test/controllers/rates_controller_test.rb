require 'test_helper'

class RatesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
    @rate = rates(:one)
  end

  test "should get index" do
    get :index, params: { experience_id: @experience }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { experience_id: @experience }
    assert_response :success
  end

  test "should create rate" do
    assert_difference('Rate.count') do
      post :create, params: { experience_id: @experience, rate: @rate.attributes }
    end

    assert_redirected_to experience_rate_path(@experience, Rate.last)
  end

  test "should show rate" do
    get :show, params: { experience_id: @experience, id: @rate }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { experience_id: @experience, id: @rate }
    assert_response :success
  end

  test "should update rate" do
    put :update, params: { experience_id: @experience, id: @rate, rate: @rate.attributes }
    assert_redirected_to experience_rate_path(@experience, Rate.last)
  end

  test "should destroy rate" do
    assert_difference('Rate.count', -1) do
      delete :destroy, params: { experience_id: @experience, id: @rate }
    end

    assert_redirected_to experience_rates_path(@experience)
  end
end
