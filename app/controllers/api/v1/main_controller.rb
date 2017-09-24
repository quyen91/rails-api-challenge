class Api::V1::MainController < ApplicationController
  before_action :require_current_user

  private
  def require_current_user
    unless @current_user = User.last
      render json: { error: 'You need register at least a user to continue'}, status: 401
    end
  end
end