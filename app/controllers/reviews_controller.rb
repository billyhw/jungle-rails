class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Product Review created!'
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
