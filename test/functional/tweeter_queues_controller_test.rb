require 'test_helper'

class TweeterQueuesControllerTest < ActionController::TestCase
  setup do
    @tweeter_queue = tweeter_queues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweeter_queues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweeter_queue" do
    assert_difference('TweeterQueue.count') do
      post :create, tweeter_queue: { name: @tweeter_queue.name }
    end

    assert_redirected_to tweeter_queue_path(assigns(:tweeter_queue))
  end

  test "should show tweeter_queue" do
    get :show, id: @tweeter_queue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweeter_queue
    assert_response :success
  end

  test "should update tweeter_queue" do
    put :update, id: @tweeter_queue, tweeter_queue: { name: @tweeter_queue.name }
    assert_redirected_to tweeter_queue_path(assigns(:tweeter_queue))
  end

  test "should destroy tweeter_queue" do
    assert_difference('TweeterQueue.count', -1) do
      delete :destroy, id: @tweeter_queue
    end

    assert_redirected_to tweeter_queues_path
  end
end
