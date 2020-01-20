class Api::V1::WidgetsController < ApplicationController
  def index
    widgets = Widget.all_public
    render json: widgets
  end

  def show
    widget = Widget.find(params['id'])
    return not_found unless widget.is_public
    render json: widget
  end
end
