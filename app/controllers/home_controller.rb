class HomeController < ApplicationController
  layout "landing"
  allow_unauthenticated_access only: %i[ index ]

  def index
  end
end
