class ApplicationController < ActionController::Base
  private

  def not_authenticated
    redirect_to root_path, alert: "Access Denied"
  end
end
