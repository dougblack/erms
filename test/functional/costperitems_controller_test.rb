require 'test_helper'

class CostperitemsControllerTest < ActionController::TestCase
  setup do
    @costperitem = costperitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costperitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costperitem" do
    assert_difference('Costperitem.count') do
      post :create, costperitem: @costperitem.attributes
    end

    assert_redirected_to costperitem_path(assigns(:costperitem))
  end

  test "should show costperitem" do
    get :show, id: @costperitem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costperitem.to_param
    assert_response :success
  end

  test "should update costperitem" do
    put :update, id: @costperitem.to_param, costperitem: @costperitem.attributes
    assert_redirected_to costperitem_path(assigns(:costperitem))
  end

  test "should destroy costperitem" do
    assert_difference('Costperitem.count', -1) do
      delete :destroy, id: @costperitem.to_param
    end

    assert_redirected_to costperitems_path
  end
end
