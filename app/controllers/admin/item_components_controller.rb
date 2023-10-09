# frozen_string_literal: true

module Admin
  class ItemComponentsController < BaseController
    def index
      @item_components = ItemComponent.all
    end

    def show
      @item_component = ItemComponent.find(params[:id])
    end

    def new
      @item_component = ItemComponent.new
    end

    def create
      @item_component = ItemComponent.new(item_component_params)
      if @item_component.save
        # TODO: Item id's need to be an array if used in multiple items
        create_item_component
        redirect_to @item_component
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @item_component = ItemComponent.find(params[:id])
    end

    def update
      @item_component = ItemComponent.find(params[:id])

      if @item_component.update(item_component_params)
        redirect_to @item_component
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @item_component = ItemComponent.find(params[:id])
      @item_component.destroy
      redirect_to item_components_path, status: :see_other
    end

    private

    def create_item_component
      return unless params[:item_id]

      item_component_item = ItemComponentItem.new(item_component_id: @item_component.id, item_id: params[:item_id])
      if item_component_item.save
        redirect_to @item_component
      else
        render json: 'Component created but not saved to items'
      end
    end

    def item_component_params
      params.require(:item_component).permit(:name, :description, :price, :supplier_id, :item_id)
    end
  end
end
