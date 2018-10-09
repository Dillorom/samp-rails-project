class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user, serializer: CommentUserSerializer

  # def username
  #   object.user.username
  # end
end
