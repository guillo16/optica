class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :photo, :content)
  end

  def set_articles
    @article = Article.find(params[:id])
  end
end
