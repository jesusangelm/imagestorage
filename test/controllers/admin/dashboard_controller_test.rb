require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get admin dashboard index" do
    get admin_dashboard_url
    assert_response :success
    assert response.body.include?("Dashboard")
    assert response.body.include?("Categories")
    assert response.body.include?("Items")
  end
end
