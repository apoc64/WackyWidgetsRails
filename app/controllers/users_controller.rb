class UsersController < ApplicationController
  before_action :require_login

  def show
    not_authenticated unless current_user.id == params[:id].to_i
    @user = current_user
  end
end
