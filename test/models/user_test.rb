require 'test_helper'


 
class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User", email: "user@example.com")
		
	end
	test "should be valid" do 
		assert @user.valid?
	
end

test "name should be present" do 
	@user.name = "a" * 51
	assert_not @user.valid?
end

test "email addresses should be unique" do 
	duplicate_user = @user.dup 
	duplicate_user.email = @user.email.upcase
	@user.save
	assert_not duplicate_user.valid?
end

test "email addresses should be saved as lower-case" do 
	mixed_case_email = "Foo@Example.COM"
	@user.email = mixed_case_email
	@user.save
	assert_equal mixed_case_email.downcase, @user.reload.email
end

