require 'test_helper'

class UserLabsControllerTest < ActionController::TestCase
  setup do
    @user_lab = user_labs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_labs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_lab" do
    assert_difference('UserLab.count') do
      post :create, user_lab: { lab_id: @user_lab.lab_id, user_id: @user_lab.user_id }
    end

    assert_redirected_to user_lab_path(assigns(:user_lab))
  end

  test "should show user_lab" do
    get :show, id: @user_lab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_lab
    assert_response :success
  end

  test "should update user_lab" do
    patch :update, id: @user_lab, user_lab: { lab_id: @user_lab.lab_id, user_id: @user_lab.user_id }
    assert_redirected_to user_lab_path(assigns(:user_lab))
  end

  test "should destroy user_lab" do
    assert_difference('UserLab.count', -1) do
      delete :destroy, id: @user_lab
    end

    assert_redirected_to user_labs_path
  end
end
