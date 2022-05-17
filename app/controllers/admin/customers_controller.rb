class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:update] = 'You have updated customer successfully.'
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

private

  def customer_params
    params.require(:customer).permit(:name, :is_deleted)
  end


end
