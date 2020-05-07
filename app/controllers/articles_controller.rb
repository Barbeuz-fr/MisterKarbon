class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!,
                      only: [ :show,
                              :index,
                              :reglementation_entreprise,
                              :comment_faire_son_bilan_carbone,
                              :test]

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

  def comment_faire_son_bilan_carbone
    render :layout => 'home'
  end

  def test
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
