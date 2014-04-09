require 'test_helper'

class InputOutputControllerTest < ActionController::TestCase
  test "should get io" do
    get :io
    assert_response :success
  end

end
