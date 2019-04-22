class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # devuelve la vista con el formulario
    @article = Article.new

  end

  def create
    # guarda la información
    @article = Article.new(
      title: params[:article][:title]
      body: params[:article][:body]
    )
    if @article.save
      redirect_to(@article)
    else
      render new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article
  end

  def article_params
    params.require(:article).permit(:title, :body)
end