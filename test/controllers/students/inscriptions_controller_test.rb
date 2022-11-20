require "test_helper"

class Students::InscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get students_inscriptions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get students_inscriptions_destroy_url
    assert_response :success
  end
end
