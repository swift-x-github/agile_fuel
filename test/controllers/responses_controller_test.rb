require 'test_helper'

class ResponsesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
    @response = responses(:one)
  end

  test "should get index" do
    get :index, params: { experience_id: @experience }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { experience_id: @experience }
    assert_response :success
  end

  test "should create response" do
    assert_difference('Response.count') do
      post :create, params: { experience_id: @experience, response: @response.attributes }
    end

    assert_redirected_to experience_response_path(@experience, Response.last)
  end

  test "should show response" do
    get :show, params: { experience_id: @experience, id: @response }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { experience_id: @experience, id: @response }
    assert_response :success
  end

  test "should update response" do
    put :update, params: { experience_id: @experience, id: @response, response: @response.attributes }
    assert_redirected_to experience_response_path(@experience, Response.last)
  end

  test "should destroy response" do
    assert_difference('Response.count', -1) do
      delete :destroy, params: { experience_id: @experience, id: @response }
    end

    assert_redirected_to experience_responses_path(@experience)
  end
end
