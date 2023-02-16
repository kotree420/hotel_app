require "test_helper"

class BookingResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booking_results_index_url
    assert_response :success
  end
end
