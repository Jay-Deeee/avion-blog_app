require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save a comment without a commenter" do
  article = Article.create(title:"First", body:"body of the first article.")
    comment = Comment.new(commenter: nil, body: "Hello there", article_id: article.id)
    assert_not comment.save
  end

  test "should not save a comment without a body" do
    article = Article.create(title:"First", body:"body of the first article.")
    comment = Comment.new(commenter: "Jino", body: "Hello there", article_id: article.id)
    assert comment.save
  end
end
