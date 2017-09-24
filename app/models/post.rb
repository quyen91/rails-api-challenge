class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :content

  def add_comment params, user
    self.comments.create(params.merge({ user_id: user.id }))
  end
end
