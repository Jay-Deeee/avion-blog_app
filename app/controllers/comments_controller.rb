class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @article.comments
  end

  def show; end

  def create
    @comment = @article.comments.create(comment_params)

    if @comment.persisted?
      redirect_to article_path(@article), notice: "Comment saved successfully."
    else
      flash.now[:alert] = "Failed to save comment."
      render "articles/show", status: :unprocessable_entity
    end
  end

  def edit; end
  
  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: "Comment has been updated."
    else
      flash[:alert] = "Failed to update comment."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to @article, status: :see_other, notice: "Comment has been deleted."
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
