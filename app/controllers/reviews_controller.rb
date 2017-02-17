class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    product = Product.find(params[:id])
    @review = product.reviews.new(review_params)
    if @review.save
      redirect_to @review, notice: 'Review was successfully saved'
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
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content)
    end
end
