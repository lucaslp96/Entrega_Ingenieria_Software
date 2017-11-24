require 'test_helper'

class QuestionCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get question_comments_new_url
    assert_response :success
  end

  test "should get edit" do
    get question_comments_edit_url
    assert_response :success
  end

end
