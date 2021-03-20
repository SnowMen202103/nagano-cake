class Customer::AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer = current_customer
    if @address.save
    redirect_to request.referer
    else
      @addresses = Address.all
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
