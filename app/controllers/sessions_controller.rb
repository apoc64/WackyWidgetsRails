class SessionsController < ApplicationController

  def create
    user = login(session_params[:email], session_params[:password])
    if user
      redirect_to user_path(user), notice: 'Logged in successfully'
    else
      redirect_to root_path, alert: 'Invalid email or password'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out successfully'
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end
