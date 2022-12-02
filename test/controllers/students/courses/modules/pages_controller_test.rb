require "test_helper"

class Students::Courses::Modules::PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get students_courses_modules_pages_show_url
    assert_response :success
  end
end
