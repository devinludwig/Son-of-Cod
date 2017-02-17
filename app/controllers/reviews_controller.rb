class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
  end

  def create
  end

  def edit
  end

  def update
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
