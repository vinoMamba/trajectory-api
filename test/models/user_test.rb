require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid: user with all valid things' do
    user = User.new({ full_name: 'vino1', password_digest: '123456' })
    assert user.valid?
  end
  test 'invalid: user with invalid password_digest' do
    user = User.new({ full_name: 'vino2', password_digest: '' })
    assert_not user.valid?
  end
  test 'invalid: user with repeat full_name' do
    user = User.new({ full_name: users(:one).full_name, password_digest: '' })
    assert_not user.valid?
  end

  test 'valid: user with valid password' do
    user = User.new({ full_name: 'vino2', password: '123456' })
    assert user.valid?
  end
end
