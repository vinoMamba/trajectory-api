require "test_helper"

class MockController
  include Authuser
  attr_accessor :request
end

class MockRequest
  attr_accessor :headers

  def initialize (headers)
    @headers = headers
  end
end

class AuthuserTest < ActionDispatch::IntegrationTest
  setup do
    @user_one = users(:one)
    @authentication = MockController.new
    @authentication.request = MockRequest.new({})
  end

  test "should get user from Authorization token" do
    @authentication.request.headers["Authorization"] = JsonWebToken.encode(user_id: @user_one.id)
    assert_not_nil @authentication.request.headers['Authorization']
    assert_not_nil @authentication.current_user
    assert_equal @user_one.id, @authentication.current_user.id
  end
end
