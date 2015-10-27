require 'test_helper'

class CongressmenControllerTest < ActionController::TestCase
  setup do
    @congressman = congressmen(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:congressmen)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create congressman" do
    assert_difference('Congressman.count') do
      post :create, congressman: { area: @congressman.area, ej: @congressman.ej, lecture: @congressman.lecture, name: @congressman.name }
    end

    assert_redirected_to congressman_path(assigns(:congressman))
  end

  test "should show congressman" do
    get :show, id: @congressman
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @congressman
    assert_response :success
  end

  test "should update congressman" do
    patch :update, id: @congressman, congressman: { area: @congressman.area, ej: @congressman.ej, lecture: @congressman.lecture, name: @congressman.name }
    assert_redirected_to congressman_path(assigns(:congressman))
  end

  test "should destroy congressman" do
    assert_difference('Congressman.count', -1) do
      delete :destroy, id: @congressman
    end

    assert_redirected_to congressmen_path
  end
end
