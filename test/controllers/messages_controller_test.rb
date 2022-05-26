require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get messages" do
    get messages_messages_url
    assert_response :success
  end
end
