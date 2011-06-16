require 'test_helper'

class TramosControllerTest < ActionController::TestCase
  setup do
    @tramo = tramos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tramos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tramo" do
    assert_difference('Tramo.count') do
      post :create, :tramo => @tramo.attributes
    end

    assert_redirected_to tramo_path(assigns(:tramo))
  end

  test "should show tramo" do
    get :show, :id => @tramo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tramo.to_param
    assert_response :success
  end

  test "should update tramo" do
    put :update, :id => @tramo.to_param, :tramo => @tramo.attributes
    assert_redirected_to tramo_path(assigns(:tramo))
  end

  test "should destroy tramo" do
    assert_difference('Tramo.count', -1) do
      delete :destroy, :id => @tramo.to_param
    end

    assert_redirected_to tramos_path
  end
end
