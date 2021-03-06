require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'index_success: should show all user' do
    get api_v1_users_path, as: :json
    assert_response 200
  end

  test 'show_success: should show a user' do
    get api_v1_user_path(@user), as: :json
    json_response = JSON.parse(self.response.body)
    assert_response 200
    assert_equal @user.full_name, json_response['data']['full_name']
  end

  test 'create_success: should create a user' do
    assert_difference('User.count', 1) do
      post api_v1_users_path,
           params: { user: { full_name: 'koko', password: '123' } },
           as: :json
    end
    assert_response 201
  end
end
