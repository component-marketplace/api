require "test_helper"

class Admin::BatchActionControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_batch_action_destroy_url
    assert_response :success
  end
end
