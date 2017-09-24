class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :newest_comments, -> { order(updated_at: :desc).limit(2) }, class_name: Comment.name
  validates_presence_of :title, :content

  def add_comment params, user
    self.comments.create(params.merge({ user_id: user.id }))
  end
end
