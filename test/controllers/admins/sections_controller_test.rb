require "test_helper"

class Admins::SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_sections_create_url
    assert_response :success
  end

  test "should get update" do
    get admins_sections_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_sections_destroy_url
    assert_response :success
  end
end
