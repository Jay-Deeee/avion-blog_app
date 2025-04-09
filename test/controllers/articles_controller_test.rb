require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get articles index" do
    get '/articles'
    assert_response :success # can also be :ok and 200
  end

  test "should get new page" do
    get '/articles/new'
    assert_response :ok
  end

  test "should create an article" do
    post articles_path, params: { article: {title: "New Title", body: "New body for article"} }
    assert_response :redirect
  end

  # fix these tests
  test "should be able to edit an article" do
    post articles_path, params: { article: {title: "New Title", body: "New body for article"} }
    # get edit_articles_path, params: { article: {title: "Edited Title", body: "Edited body for the article"} }
    assert_response :redirect
  end

  test "should be able to delete an article" do
    # post articles_path, params: { article: {title: "New Title", body: "New body for article"} }
    # assert_response :redirect
  end
end
