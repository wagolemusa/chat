require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get pages" do
    get :pages
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
  	get :help
  	assert_response :success
  	assert_select "title", "Help | Ruby on Rails Tutorial Sample App"

  end

  test "should get about" do
  	get :about
  	assert_response :success
  	assert_select "title", "About", "About | Ruby on Rails Tutorial Sample App"
  end

end
