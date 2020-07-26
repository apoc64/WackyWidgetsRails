class UsersController < ApplicationController
  before_action :require_login, except: [:new]

  def show
    not_authenticated unless current_user.id == params[:id].to_i
    @user = current_user
  end

  def new

  end
end
