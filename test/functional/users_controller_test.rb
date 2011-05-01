require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.last
  end

  test "should get index" do
    get(:index, nil, {'user_id' => @user.id})
    assert_response :success
  end
  
  test "should make a new user record" do
    post :new
    assert_response :success
  end
  
  test "should load the edit page for an individual user record" do
    get(:edit, {'id' => @user.id}, {'user_id' => @user.id})
    assert_response :success
  end

  test "one user should not load the edit page for another user" do
    get(:edit, {'id' => @user.id}, {'user_id' => '1'})
    assert_response 302
  end
  
  test "should update an individual user record" do
    post(:edit, {'id' => @user.id}, {'user_id' => @user.id}, {'user' => @user})
    assert_response :success
  end

  test "one user should not update another's record" do
    post(:edit, {'id' => @user.id}, {'user_id' => '1'}, {'user' => @user})
    assert_response 302
  end
  
  test "should view an individual user record" do
    @user = User.last
    get(:show, {'id' => @user.id}, {'user_id' => @user.id}) 
    assert_response :success
  end

  test "one user should not view another's record" do
    @user = User.last
    get(:show, {'id' => @user.id}, {'user_id' => '1'}) 
    assert_response 302
  end

  test "should delete an individual user record" do
    @user = User.last
    get(:show, {'id' => @user.id}, {'user_id' => @user.id})
    assert_response :success
  end

  test "one user should not delete another user's record" do
    @user = User.last
    get(:show, {'id' => @user.id}, {'user_id' => '1'})
    assert_response 302
  end
end
