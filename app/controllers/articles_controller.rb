class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]="Article was successfully updated" #message affiché
      redirect_to article_path(@article) #redirection vers la page initiale des articles
    else
      render 'edit' #sinon recharge la page
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end
