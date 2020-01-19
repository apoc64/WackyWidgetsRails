class Api::V1::WidgetsController < ApplicationController
  def index
    widgets = Widget.all_public
    render json: widgets
  end
end
