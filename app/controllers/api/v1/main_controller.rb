class Api::V1::MainController < ApplicationController
  before_action :require_current_user

  private
  def require_current_user
    unless @current_user = User.last
      head :unauthorized
    end
  end
end