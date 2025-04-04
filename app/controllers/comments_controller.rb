class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @article.comments
  end

  def show; end

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit; end
  
  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: "Comment has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to @article, status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
