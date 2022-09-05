class FurnitureController < ApplicationController
  def index
    @furniture_items = FurnitureItem.all
  end

  def show
    @furniture_item = FurnitureItem.find(params[:id])
  end
end
