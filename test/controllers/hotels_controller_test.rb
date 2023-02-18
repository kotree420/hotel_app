require "test_helper"

class HotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hotels_index_url
    assert_response :success
  end
end
