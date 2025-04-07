require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save an article with nil title" do
    article = Article.new
    article.title = nil
    article.body = "I wanna be the very best"
    assert article.save # should return false
  end

  test "should not save an article with short body" do
    article = Article.new(title: "Letter a", body: "a")
    assert article.save # should return false
  end

  test "should not save an article with nil body" do
    article = Article.new(title: "nil body", body: nil)
    assert_not article.save # should return true
  end
end
