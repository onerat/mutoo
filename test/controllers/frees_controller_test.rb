require 'test_helper'

class FreesControllerTest < ActionController::TestCase
  setup do
    @free = frees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create free" do
    assert_difference('Free.count') do
      post :create, free: { content: @free.content, title: @free.title, user_id: @free.user_id }
    end

    assert_redirected_to free_path(assigns(:free))
  end

  test "should show free" do
    get :show, id: @free
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @free
    assert_response :success
  end

  test "should update free" do
    patch :update, id: @free, free: { content: @free.content, title: @free.title, user_id: @free.user_id }
    assert_redirected_to free_path(assigns(:free))
  end

  test "should destroy free" do
    assert_difference('Free.count', -1) do
      delete :destroy, id: @free
    end

    assert_redirected_to frees_path
  end
end
