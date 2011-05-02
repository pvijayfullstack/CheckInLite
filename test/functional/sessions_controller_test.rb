require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @testuser = User.last
  end

  test "should create new session" do
    get(:create, {:email => "mike@mikeshea.net2", :password => "thx1138"}, {:user_id => @testuser.id}, nil)
    assert_response(:success)
    #assert_equal 'Account created.', flash[:notice]
  end
  
  test "should destroy a session" do
    delete(:destroy, nil, {'user_id' => @testuser.id})
    assert_response(:redirect, message = nil)
    assert_equal 'Logged out!', flash[:notice]
  end

end
