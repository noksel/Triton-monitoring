require 'test_helper'

class TritonSessionsControllerTest < ActionController::TestCase
  setup do
    @triton_session = triton_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:triton_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create triton_session" do
    assert_difference('TritonSession.count') do
      post :create, triton_session: { dateStart: @triton_session.dateStart }
    end

    assert_redirected_to triton_session_path(assigns(:triton_session))
  end

  test "should show triton_session" do
    get :show, id: @triton_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @triton_session
    assert_response :success
  end

  test "should update triton_session" do
    put :update, id: @triton_session, triton_session: { dateStart: @triton_session.dateStart }
    assert_redirected_to triton_session_path(assigns(:triton_session))
  end

  test "should destroy triton_session" do
    assert_difference('TritonSession.count', -1) do
      delete :destroy, id: @triton_session
    end

    assert_redirected_to triton_sessions_path
  end
end
