class ArticlesController < ApplicationController

  def index
    @articles = Article.all()
    render :layout => 'home'
  end

  def show
    @article = Article.find(params[:id])
    render :layout => 'home'
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :header, :text, :category, :author)
  end
end
