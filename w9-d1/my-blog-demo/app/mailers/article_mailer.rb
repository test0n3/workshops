class ArticleMailer < ApplicationMailer
	default from: 'notifications@myblog.com'

	def article_created
		@user = params[:user]
		@article = params[:article]
		mail(to: @user.email, subject: 'New article created')
	end
end
