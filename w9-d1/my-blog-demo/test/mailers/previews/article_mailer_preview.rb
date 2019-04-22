# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview
  def article_created
	  ArticleMailer.with(user: User.last, article: Article.last).article_created
  end
end
