class Admin::BatchActionController < ApplicationController
  def batch_destroy
    params[:class_name].constantize.delete(params[:ids])
    redirect_back(fallback_location: root_path)
  end
end
