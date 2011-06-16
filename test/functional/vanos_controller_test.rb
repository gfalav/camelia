require 'test_helper'

class VanosControllerTest < ActionController::TestCase
  setup do
    @vano = vanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vano" do
    assert_difference('Vano.count') do
      post :create, :vano => @vano.attributes
    end

    assert_redirected_to vano_path(assigns(:vano))
  end

  test "should show vano" do
    get :show, :id => @vano.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vano.to_param
    assert_response :success
  end

  test "should update vano" do
    put :update, :id => @vano.to_param, :vano => @vano.attributes
    assert_redirected_to vano_path(assigns(:vano))
  end

  test "should destroy vano" do
    assert_difference('Vano.count', -1) do
      delete :destroy, :id => @vano.to_param
    end

    assert_redirected_to vanos_path
  end
end
