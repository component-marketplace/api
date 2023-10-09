# frozen_string_literal: true

module Admin
  class AdminUsersController < BaseController
    def index
      @admin_users = AdminUser.all
    end

    def show
      @admin_user = AdminUser.find(params[:id])
    end

    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new(admin_user_params)
      if @admin_user.save
        redirect_to adminadmin_users_path, notice: 'Admin User created'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @admin_user = AdminUser.find(params[:id])
      @admin_user.destroy
      redirect_to adminusers_path, status: :see_other
    end

    private

    def admin_user_params
      params.require(:admin_user).permit(:email, :password, :password_confirmation)
    end
  end
end
