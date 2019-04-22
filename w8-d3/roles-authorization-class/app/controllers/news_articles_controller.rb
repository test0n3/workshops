class NewsArticlesController < ApplicationController
  def index
    authorize(NewsArticle) # NewsArticlePolicy.index?
    @news_articles = policy_scope(NewsArticle) # NewsArticlePolicy::Scope.resolve
  end

  def show
    authorize(NewsArticle)
    @news_article = NewsArticle.find(params[:id])
  end
end
