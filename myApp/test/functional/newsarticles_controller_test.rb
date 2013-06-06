require 'test_helper'

class NewsarticlesControllerTest < ActionController::TestCase
  setup do
    @newsarticle = newsarticles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsarticles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newsarticle" do
    assert_difference('Newsarticle.count') do
      post :create, newsarticle: { article: @newsarticle.article, name: @newsarticle.name, title: @newsarticle.title }
    end

    assert_redirected_to newsarticle_path(assigns(:newsarticle))
  end

  test "should show newsarticle" do
    get :show, id: @newsarticle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newsarticle
    assert_response :success
  end

  test "should update newsarticle" do
    put :update, id: @newsarticle, newsarticle: { article: @newsarticle.article, name: @newsarticle.name, title: @newsarticle.title }
    assert_redirected_to newsarticle_path(assigns(:newsarticle))
  end

  test "should destroy newsarticle" do
    assert_difference('Newsarticle.count', -1) do
      delete :destroy, id: @newsarticle
    end

    assert_redirected_to newsarticles_path
  end
end
