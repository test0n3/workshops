class ArticleSerializer < ActiveModel::Serializer
  attributes :title, :body
  attribute :body_characters, if: :article_first
  has_many :comments

  def article_first
    object.id == 1
  end

  def body_characters
    object.body.size
  end
end
