require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save a user without an email" do
    user = User.new
    assert_not user.save
  end
end
