class CommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :body
end
