class WelcomeController < ApplicationController
  def index
    render json: {test: 'welcome'}
  end

  def error_404
    render_json([404, 'Page Not Found'])
  end
end
