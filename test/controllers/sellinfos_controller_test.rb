require 'test_helper'

class SellinfosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sellinfos_create_url
    assert_response :success
  end

end
