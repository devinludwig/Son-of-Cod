class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    authorize! :manage, @product
  end

  def create
    @product = Product.new(product_params)
    authorize! :manage, @product
    if @product.save
      redirect_to @product, notice: 'Product was successfully saved'
    else
      render :new
    end
  end

  def edit
    authorize! :manage, @product
  end

  def update
    authorize! :manage, @product
    if @product.update(product_params)
      redirect_to @product, notice: 'Product has been updated'
    else
      render :edit
    end
  end

  def destroy
    authorize! :manage, @product
    @product.destroy
    redirect_to products_path
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
