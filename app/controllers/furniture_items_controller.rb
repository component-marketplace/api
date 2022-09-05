class FurnitureItemsController < ApplicationController
  def index
    @furniture_items = FurnitureItem.all
  end

  def show
    @furniture_item = FurnitureItem.find(params[:id])
  end

  def new
    @furniture_item = FurnitureItem.new
  end

  def create
    @furniture_item = FurnitureItem.new(furniture_item_params)
    if @furniture_item.save
      redirect_to @furniture_item
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @furniture_item = FurnitureItem.find(params[:id])
  end

  def update
    @furniture_item = FurnitureItem.find(params[:id])

    if @furniture_item.update(furniture_item_params)
      redirect_to @furniture_item
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @furniture_item = FurnitureItem.find(params[:id])
    @furniture_item.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def furniture_item_params
      params.require(:furniture_item).permit(:name, :description)
    end
end
