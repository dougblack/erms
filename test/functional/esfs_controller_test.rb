require 'test_helper'

class EsfsControllerTest < ActionController::TestCase
  setup do
    @esf = esfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:esfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create esf" do
    assert_difference('Esf.count') do
      post :create, esf: @esf.attributes
    end

    assert_redirected_to esf_path(assigns(:esf))
  end

  test "should show esf" do
    get :show, id: @esf.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @esf.to_param
    assert_response :success
  end

  test "should update esf" do
    put :update, id: @esf.to_param, esf: @esf.attributes
    assert_redirected_to esf_path(assigns(:esf))
  end

  test "should destroy esf" do
    assert_difference('Esf.count', -1) do
      delete :destroy, id: @esf.to_param
    end

    assert_redirected_to esfs_path
  end
end
