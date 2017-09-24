class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id
end
