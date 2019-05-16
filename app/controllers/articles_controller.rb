class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def edit

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice]="Article was successfully created" #message affiché
      redirect_to article_path(@article) #redirection vers la page initiale des articles
    else
      render 'new' #sinon recharge la page
    end
  end

  def update

    if @article.update(article_params)
      flash[:notice]="Article was successfully updated" #message affiché
      redirect_to article_path(@article) #redirection vers la page initiale des articles
    else
      render 'edit' #sinon recharge la page
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
    params.require(:article).permit(:title, :description)
  end

end
