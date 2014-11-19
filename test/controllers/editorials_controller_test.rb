require 'test_helper'

class EditorialsControllerTest < ActionController::TestCase
  setup do
    @editorial = editorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editorial" do
    assert_difference('Editorial.count') do
      post :create, editorial: { name: @editorial.name }
    end

    assert_redirected_to editorial_path(assigns(:editorial))
  end

  test "should show editorial" do
    get :show, id: @editorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @editorial
    assert_response :success
  end

  test "should update editorial" do
    patch :update, id: @editorial, editorial: { name: @editorial.name }
    assert_redirected_to editorial_path(assigns(:editorial))
  end

  test "should destroy editorial" do
    assert_difference('Editorial.count', -1) do
      delete :destroy, id: @editorial
    end

    assert_redirected_to editorials_path
  end
end
