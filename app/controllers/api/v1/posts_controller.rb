class Api::V1::PostsController < Api::V1::MainController

  # GET v1/posts
  def index
    @posts = Post.order(updated_at: :desc).includes(:newest_comments).to_a
    render json: @posts, each_serializer: Api::V1::PostSerializer, root: nil
  end

  # POST v1/posts
  def create
    @post = User.last.posts.create(post_params)
    if @post.save
      render json: { post_id: @post.id }, status: :ok
    else
      render json: { error: @post.errors}, status: :unprocessable_entity
    end
  end

  # GET v1/posts/:id
  def show
    if @post = Post.find_by(id: params[:id])
      render json: @post, serializeer: Api::V1::PostsController, root: nil
    else
      render json: { errors: 'Record not found'}, status: 404
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
