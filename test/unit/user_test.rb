require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "save_new_user" do
    user = User.new
    assert !user.save
  end
end
