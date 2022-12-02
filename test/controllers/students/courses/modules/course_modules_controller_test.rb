require "test_helper"

class Students::Courses::Modules::CourseModulesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get students_courses_modules_course_modules_new_url
    assert_response :success
  end
end
