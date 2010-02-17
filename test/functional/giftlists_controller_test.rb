require 'test_helper'

class GiftlistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:giftlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create giftlist" do
    assert_difference('Giftlist.count') do
      post :create, :giftlist => { }
    end

    assert_redirected_to giftlist_path(assigns(:giftlist))
  end

  test "should show giftlist" do
    get :show, :id => giftlists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => giftlists(:one).to_param
    assert_response :success
  end

  test "should update giftlist" do
    put :update, :id => giftlists(:one).to_param, :giftlist => { }
    assert_redirected_to giftlist_path(assigns(:giftlist))
  end

  test "should destroy giftlist" do
    assert_difference('Giftlist.count', -1) do
      delete :destroy, :id => giftlists(:one).to_param
    end

    assert_redirected_to giftlists_path
  end
end
