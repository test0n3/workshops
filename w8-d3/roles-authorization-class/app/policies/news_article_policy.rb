class NewsArticlePolicy < ApplicationPolicy
  attr_reader :user, :news_article

  def initialize(user, news_article)
    @user = user
    @news_article = news_article
  end

  def index?
    user.admin? || user.staff?
  end

  def update?
    user.admin? or not news_article.published_at?
  end

  class Scope
    # Scope here is the NewsArticle model
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all # NewsArticle.all
      else
        scope.where.not(published_at: nil) # NewsArticle.where
      end
    end
  end
end
