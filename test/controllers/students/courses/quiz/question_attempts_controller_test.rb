require "test_helper"

class Students::Courses::Quiz::QuestionAttemptsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get students_courses_quiz_question_attempts_new_url
    assert_response :success
  end
end
