class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
#      ArticleMailer.with(user: current_user, article: @article).article_created.deliver_now envio inmediato, sincronizado
      # ArticleMailer.with(user: current_user, article: @article).article_created.deliver_later 
      SendArticleCreatedNotificationJob.perform_later @article
      redirect_to(article_path(@article.id))
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(articles_path)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :cover)
  end
end
