require 'test_helper'

class BuyinfosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buyinfos_new_url
    assert_response :success
  end

end
