class Api::V1::CommentsController < Api::V1::MainController
  before_action :require_post

  def index
    comments = @post.comments.to_a
    render json: comments, each_serializer: Api::V1::CommentSerializer, root: nil
  end

  def create
    if comment = @post.add_comment(comment_params, @current_user)
      render json: { comment_id: comment.id }, status: :ok
    else
      render json: { error: @comment.errors}, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_post
    unless @post = Post.find_by(id: params[:id])
      render json: { error: :invalid_params }, status: :unprocessable_entity
    end
  end
end
