require 'test_helper'

class Admin::BrowsersControllerTest < ActionController::TestCase
  setup do
    @admin_browser = admin_browsers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_browsers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_browser" do
    assert_difference('Admin::Browser.count') do
      post :create, admin_browser: { user_agent: @admin_browser.user_agent, uuid: @admin_browser.uuid }
    end

    assert_redirected_to admin_browser_path(assigns(:admin_browser))
  end

  test "should show admin_browser" do
    get :show, id: @admin_browser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_browser
    assert_response :success
  end

  test "should update admin_browser" do
    put :update, id: @admin_browser, admin_browser: { user_agent: @admin_browser.user_agent, uuid: @admin_browser.uuid }
    assert_redirected_to admin_browser_path(assigns(:admin_browser))
  end

  test "should destroy admin_browser" do
    assert_difference('Admin::Browser.count', -1) do
      delete :destroy, id: @admin_browser
    end

    assert_redirected_to admin_browsers_path
  end
end
