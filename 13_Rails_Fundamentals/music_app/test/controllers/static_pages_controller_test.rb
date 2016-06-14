require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get test" do
    get :test
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
