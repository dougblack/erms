require 'test_helper'

class AddesfsControllerTest < ActionController::TestCase
  setup do
    @addesf = addesfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addesfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addesf" do
    assert_difference('Addesf.count') do
      post :create, addesf: @addesf.attributes
    end

    assert_redirected_to addesf_path(assigns(:addesf))
  end

  test "should show addesf" do
    get :show, id: @addesf.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @addesf.to_param
    assert_response :success
  end

  test "should update addesf" do
    put :update, id: @addesf.to_param, addesf: @addesf.attributes
    assert_redirected_to addesf_path(assigns(:addesf))
  end

  test "should destroy addesf" do
    assert_difference('Addesf.count', -1) do
      delete :destroy, id: @addesf.to_param
    end

    assert_redirected_to addesfs_path
  end
end
