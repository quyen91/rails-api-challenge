class Api::V1::UsersController < Api::V1::MainController
  skip_before_action :require_current_user, only: [:register]

  def index
    @users = User.all
    render json: @users, each_serializer:  Api::V1::UserSerializer
  end

  def register
    @user = User.create(user_params)
    if @user.save
      render json: { user_id: @user.id }, status: :ok
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
