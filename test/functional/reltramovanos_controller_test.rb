require 'test_helper'

class ReltramovanosControllerTest < ActionController::TestCase
  setup do
    @reltramovano = reltramovanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reltramovanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reltramovano" do
    assert_difference('Reltramovano.count') do
      post :create, :reltramovano => @reltramovano.attributes
    end

    assert_redirected_to reltramovano_path(assigns(:reltramovano))
  end

  test "should show reltramovano" do
    get :show, :id => @reltramovano.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reltramovano.to_param
    assert_response :success
  end

  test "should update reltramovano" do
    put :update, :id => @reltramovano.to_param, :reltramovano => @reltramovano.attributes
    assert_redirected_to reltramovano_path(assigns(:reltramovano))
  end

  test "should destroy reltramovano" do
    assert_difference('Reltramovano.count', -1) do
      delete :destroy, :id => @reltramovano.to_param
    end

    assert_redirected_to reltramovanos_path
  end
end
