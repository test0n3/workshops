module NewsArticlesHelper
  def can_view_author?(user)
    user.admin?
  end
end
