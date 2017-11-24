require 'test_helper'

class StaticViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get static_views_about_url
    assert_response :success
  end

  test "should get contact" do
    get static_views_contact_url
    assert_response :success
  end

end
