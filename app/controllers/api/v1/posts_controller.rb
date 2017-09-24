class Api::V1::PostsController < Api::V1::MainController

  # GET v1/posts
  def index
    @posts = Post.all.includes(:comments).to_a
    render json: @posts, each_serializer: Api::V1::PostSerializer, root: nil
  end

  # POST v1/posts
  def create
    @post = User.last.posts.create(post_params)
    if @post.save
      render json: { status: :success }, status: :ok
    else
      render json: { status: :failed}, status: :unprocessable_entity
    end
  end

  # GET v1/posts/:id
  def show
    @post = Post.find_by(id: params[:id])
    render json: @post, serializeer: Api::V1::PostsController
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
