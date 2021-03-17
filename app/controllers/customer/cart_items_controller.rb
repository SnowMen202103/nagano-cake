class Customer::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.where(customer_id:current_customer.id)
  end

  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
  
    @cart_items.save
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end
  
  def destroy_all
    cart_items = CartItem.where(customer_id:current_customer)
    cart_items.destroy_all
    redirect_to request.referer
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
