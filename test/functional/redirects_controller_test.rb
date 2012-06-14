require 'test_helper'

class RedirectsControllerTest < ActionController::TestCase
  setup do
    @redirect = redirects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:redirects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create redirect" do
    assert_difference('Redirect.count') do
      post :create, redirect: { medium_id: @redirect.medium_id, target_id: @redirect.target_id }
    end

    assert_redirected_to redirect_path(assigns(:redirect))
  end

  test "should show redirect" do
    get :show, id: @redirect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @redirect
    assert_response :success
  end

  test "should update redirect" do
    put :update, id: @redirect, redirect: { medium_id: @redirect.medium_id, target_id: @redirect.target_id }
    assert_redirected_to redirect_path(assigns(:redirect))
  end

  test "should destroy redirect" do
    assert_difference('Redirect.count', -1) do
      delete :destroy, id: @redirect
    end

    assert_redirected_to redirects_path
  end
end
