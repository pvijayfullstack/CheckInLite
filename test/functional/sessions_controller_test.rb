require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = User.last
  end

  test "should create new session" do
    get(:create, {:email => "mike@mikeshea.net2", :password => "thx1138"}, {'user_id' => @user.id})
    assert_response :success
  end
  
  test "should destroy a session" do
    delete(:destroy, {'user_id' => @user.id}, {'user_id' => @user.id})
    assert_response 302
  end

end
