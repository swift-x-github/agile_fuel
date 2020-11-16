require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
    @question = questions(:one)
  end

  test "should get index" do
    get :index, params: { experience_id: @experience }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { experience_id: @experience }
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, params: { experience_id: @experience, question: @question.attributes }
    end

    assert_redirected_to experience_question_path(@experience, Question.last)
  end

  test "should show question" do
    get :show, params: { experience_id: @experience, id: @question }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { experience_id: @experience, id: @question }
    assert_response :success
  end

  test "should update question" do
    put :update, params: { experience_id: @experience, id: @question, question: @question.attributes }
    assert_redirected_to experience_question_path(@experience, Question.last)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, params: { experience_id: @experience, id: @question }
    end

    assert_redirected_to experience_questions_path(@experience)
  end
end
