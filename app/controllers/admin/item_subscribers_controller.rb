class Admin::ItemSubscribersController < ApplicationController
  def index
    @item_subscribers = ItemSubscriber.all
  end

  def show
    @item_subscriber = ItemSubscriber.find(params[:id])
  end

  def new
    @item_subscriber = ItemSubscriber.new
  end

  def create
    @item_subscriber = ItemSubscriber.new(item_params)
    if @item_subscriber.save
      redirect_to @item_subscriber
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item_subscriber = ItemSubscriber.find(params[:id])
  end

  def update
    @item_subscriber = ItemSubscriber.find(params[:id])

    if @item_subscriber.update(item_params)
      redirect_to @item_subscriber
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item_subscriber = ItemSubscriber.find(params[:id])
    @item_subscriber.destroy
    redirect_to item_subscribers_path, status: :see_other
  end

  private

  def item_subscriber_params
    params.require(:item_subscriber).permit(:name, :item_id)
  end
end
