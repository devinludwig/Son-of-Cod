class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    authorize! :manage, @product
    @product = Product.new
  end

  def create
    authorize! :manage, @product
    @product = Product.new(product_params)
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
    redirect_to :index
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
