class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = @article.comments.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article: '#{@article.title}' saved successfully."
    else
      flash[:alert] = "Failed to save article."
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article has been updated."
    else
      flash[:alert] = "Failed to update article."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, notice: "Article has been deleted."
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
