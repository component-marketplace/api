# frozen_string_literal: true

module Admin
  class PurchaseReceiptsController < ApplicationController
    def index
      @purchase_receipts = PurchaseReceipt.all
    end

    def show
      @purchase_receipt = PurchaseReceipt.find(params[:id])
    end

    def new
      @purchase_receipt = PurchaseReceipt.new
    end

    def create
      @purchase_receipt = PurchaseReceipt.new(purchase_receipt_params)
      if @purchase_receipt.save
        redirect_tpurchase_receipts_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @purchase_receipt = PurchaseReceipt.find(params[:id])
    end

    def update
      @purchase_receipt = PurchaseReceipt.find(params[:id])
      if @purchase_receipt.update(purchase_receipt_params)
        redirect_to @purchase_receipt
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @purchase_receipt = PurchaseReceipt.find(params[:id])
      @purchase_receipt.destroy
      redirect_to purchase_receipts_path, status: :see_other
    end

    private

    def purchase_receipt_params
      params.require(:purchase_receipt).permit(:item_component_id, :price, :expected_arrival)
    end
  end
end
