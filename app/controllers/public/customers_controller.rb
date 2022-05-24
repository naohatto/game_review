class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  #before_action :set_current_customer

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page])
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:update] = 'You have updated customer successfully.'
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def set_current_customer
    @customer = current_customer
  end

  #def customer_params
    #params.require(:customer).permit(:profile_image, :name, :is_deleted)
  #end

end
