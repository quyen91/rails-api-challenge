class Api::V1::UsersController < Api::V1::MainController
  skip_before_action :require_current_user, only: [:register]
  before_action :require_user, only: [:load_posts]

  def index
    @users = User.all
    render json: @users, each_serializer:  Api::V1::UserSerializer, root: nil
  end

  def register
    @user = User.create(user_params)
    if @user.save
      render json: { user_id: @user.id }, status: :ok
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  def load_posts
    @posts = @user.load_posts.to_a
    render json: @posts, each_serializer:  Api::V1::PostSerializer, root: 'posts'
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end

  def require_user
    unless @user = User.find(params[:id])
      render json: { error: 'User record is not found'}, status: 404
    end
  end
end
