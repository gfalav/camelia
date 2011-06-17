require 'test_helper'

class CalcmecanicosControllerTest < ActionController::TestCase
  setup do
    @calcmecanico = calcmecanicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calcmecanicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calcmecanico" do
    assert_difference('Calcmecanico.count') do
      post :create, :calcmecanico => @calcmecanico.attributes
    end

    assert_redirected_to calcmecanico_path(assigns(:calcmecanico))
  end

  test "should show calcmecanico" do
    get :show, :id => @calcmecanico.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @calcmecanico.to_param
    assert_response :success
  end

  test "should update calcmecanico" do
    put :update, :id => @calcmecanico.to_param, :calcmecanico => @calcmecanico.attributes
    assert_redirected_to calcmecanico_path(assigns(:calcmecanico))
  end

  test "should destroy calcmecanico" do
    assert_difference('Calcmecanico.count', -1) do
      delete :destroy, :id => @calcmecanico.to_param
    end

    assert_redirected_to calcmecanicos_path
  end
end
