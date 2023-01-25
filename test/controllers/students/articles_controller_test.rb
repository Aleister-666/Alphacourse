require "test_helper"

class Students::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get students_articles_show_url
    assert_response :success
  end
end
