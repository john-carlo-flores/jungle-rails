class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.product = @product

    @user = current_user
    @review.user = @user
    
    if !@review.save
      puts @review.errors.full_messages
    end

    redirect_to product_path(@product, anchor: 'reviews')
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])
    @review.destroy

    redirect_to product_path(@product, anchor: 'reviews')
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end
end
