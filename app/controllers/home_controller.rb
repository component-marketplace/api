class HomeController < ApplicationController
  before_action :redirect_if_unauthenticated, only: [:index]

  def index
    @current_admin = CurrentAdmin.user
  end
end
