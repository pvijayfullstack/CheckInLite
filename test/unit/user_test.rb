require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "new user should not save without name, email, and pw" do
    user = User.new
    assert !user.save
  end
	
	test "authenticate email and password" do
		user = authenticate("mike@mikeshea.net", "thx1138")
		assert user
	end
 
end
