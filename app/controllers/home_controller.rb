class HomeController < BaseController
  def status
    render json: { status: 'OK' }, status: :ok
  end
end
