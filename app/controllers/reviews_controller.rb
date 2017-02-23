class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(product), notice: 'Review was successfully saved'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Product has been updated'
    else
      render :edit
    end
  end

  def destroy
    @product = @review.product
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content)
    end
end
