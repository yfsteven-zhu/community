require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | Community Prototype"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Community Prototype"
  end

end
