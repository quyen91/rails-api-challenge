class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :content

  has_many :comments, serializer:  Api::V1::CommentSerializer
  has_one :user, serializer: Api::V1::UserSerializer
end
