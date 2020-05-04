class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :reglementation_entreprise ]

  def index
    @articles = Article.all()
    render :layout => 'home'
  end

  def show
    @article = Article.find(params[:id])
    render :layout => 'home'
  end

  def reglementation_entreprise
    render :layout => 'home'
  end

  def new
    @article = Article.new()
    render :layout => 'home'
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
    render :layout => 'home'
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to root_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # no need for app/views
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :header, :text, :category, :author)
  end

end
