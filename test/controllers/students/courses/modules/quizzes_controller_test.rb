require "test_helper"

class Students::Courses::Modules::QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get students_courses_modules_quizzes_show_url
    assert_response :success
  end
end
