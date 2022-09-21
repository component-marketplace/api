class V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
    render :json => @items
  end

  def show
    @item = Item.find(params[:id])
    render :json => {
      item: @item,
      components: @item.item_components,
      cost_to_build: @item.cost_to_build,
      profit: @item.profit,
      sale_receipts: @item.sale_receipts,
      fg_buffer: @item.fg_buffer_basic
    }
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private
    def item_params
      params.permit(:name, :description)
    end
end
