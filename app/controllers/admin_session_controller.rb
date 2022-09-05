class AdminSessionController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
  end

  def create
    @admin_user = AdminUser.find_by(email: params[:admin_user][:email].downcase)
    if @admin_user.authenticate(params[:admin_user][:password])
      login @admin_user
      redirect_to root_path
    else
      flash.now[:alert] = 'Incorrect email or password.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
