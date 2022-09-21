class V1::SaleReceiptsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @sale_receipts = SaleReceipt.all
    render :json => @sale_receipts
  end

  def show
    @sale_receipt = SaleReceipt.find(params[:id])
  end

  def new
    @sale_receipt = SaleReceipt.new
  end

  def create
    @sale_receipt = SaleReceipt.new(sale_receipt_params)
    if @sale_receipt.save
      render :json => @sale_receipt
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sale_receipt = SaleReceipt.find(params[:id])
  end

  def update
    @sale_receipt = SaleReceipt.find(params[:id])
    if @sale_receipt.update(sale_receipt_params)
      redirect_to @sale_receipt
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sale_receipt = SaleReceipt.find(params[:id])
    @sale_receipt.destroy
    redirect_to sale_receipts_path, status: :see_other
  end

  private
    def sale_receipt_params
      params.permit(:item_id, :price, :organization_id, :quantity)
    end
end
