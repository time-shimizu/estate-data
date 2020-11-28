require 'test_helper'

class DistancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get distances_index_url
    assert_response :success
  end

end
