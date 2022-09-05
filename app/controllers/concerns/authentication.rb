module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path if user_signed_in?
  end

  def redirect_if_unauthenticated
    redirect_to new_admin_session_path if !user_signed_in?
  end

  private
    def current_user
      CurrentAdmin.user ||= session[:current_user_id] && AdminUser.find_by(id: session[:current_user_id])
    end

    def user_signed_in?
      CurrentAdmin.user.present?
    end
end