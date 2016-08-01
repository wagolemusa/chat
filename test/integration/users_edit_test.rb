require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:michael)
  end

  test "unsuccessful edit" do 
  	log_in_as(@user)
  	get edit_user_path(@user)
  	assert_template 'users/edit'
  	name = "Foo Bar"
  	email = "foo"
  	patch user_path(@user), user: { name: name,
  																	email: email,
  																	password:       				"",
  																	password_confirmation:  "" }

assert_not flash.empty?
assert_redirected_to @user
@user.reload
assert_equal @user.name, name
assert_equal @user.email, email
end
test "successful edit" do 
	log_in_as(@user)
	get edit_user_path(@user)
end
end
