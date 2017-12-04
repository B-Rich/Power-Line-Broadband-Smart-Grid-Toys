require 'test_helper'

class EtusivuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get etusivu_index_url
    assert_response :success
  end

end
