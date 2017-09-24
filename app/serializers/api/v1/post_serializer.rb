class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content

  has_one :user, serializer: Api::V1::UserSerializer
  has_many :newest_comments, serializer: Api::V1::CommentSerializer

  # def hot_comments
  #   object.comments.limit(2).to_a.map  do |comment|
  #     Api::V1::CommentSerializer.new(comment)
  #   end
  # end
end
