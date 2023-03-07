class BaseController < ActionController::API
  before_action :set_url_for_activestorage

  rescue_from ActionDispatch::Http::Parameters::ParseError do |exception|
    render json: { errors: [exception.message] }, status: :bad_request
  end

  private

  def set_url_for_activestorage
    return if ActiveStorage::Current.url_options.present?

    ActiveStorage::Current.url_options = { host: request.base_url }
  end
end
