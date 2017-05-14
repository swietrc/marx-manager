require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(email: "foo123@bar.com", is_admin: true)
  end

  test "email address should be unique" do
    @user.email = users(:one).email
    assert_not @user.save
  end

  test "email and password should not be empty" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 64 + "@foo.com"
    assert_not @user.valid?
  end

  test "name should not be empty" do
    @user.first_name = "    "
    assert_not @user.valid?
  end
end
