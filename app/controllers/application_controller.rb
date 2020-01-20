class ApplicationController < ActionController::Base
  private

  def not_authenticated
    redirect_to root_path, alert: "Access Denied"
  end

  def not_found
    render json: { message: 'Not Found' }, status: 404
  end
end
