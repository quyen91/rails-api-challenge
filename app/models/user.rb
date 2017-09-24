class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates_presence_of :username
  validates_uniqueness_of :username

  def load_posts
    self.posts.includes(:newest_comments)
  end
end
