class SendArticleCreatedNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    User.all.each do |user|
	    ArticleMailer
		    .with(user: user, article: article)
		    .article_created
		    .deliver_later
    end
  end
end
