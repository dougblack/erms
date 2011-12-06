require 'test_helper'

class GovernmentagenciesControllerTest < ActionController::TestCase
  setup do
    @governmentagency = governmentagencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:governmentagencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create governmentagency" do
    assert_difference('Governmentagency.count') do
      post :create, governmentagency: @governmentagency.attributes
    end

    assert_redirected_to governmentagency_path(assigns(:governmentagency))
  end

  test "should show governmentagency" do
    get :show, id: @governmentagency.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @governmentagency.to_param
    assert_response :success
  end

  test "should update governmentagency" do
    put :update, id: @governmentagency.to_param, governmentagency: @governmentagency.attributes
    assert_redirected_to governmentagency_path(assigns(:governmentagency))
  end

  test "should destroy governmentagency" do
    assert_difference('Governmentagency.count', -1) do
      delete :destroy, id: @governmentagency.to_param
    end

    assert_redirected_to governmentagencies_path
  end
end
