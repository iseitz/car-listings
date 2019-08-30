class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  private

  def search_params
    params.require(:search).permit(:manufacturer, :color, :year, :mileage)
  end
end
