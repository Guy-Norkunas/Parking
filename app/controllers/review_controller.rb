class ReviewController < ApplicationController
    before_action :authenticate_user!

    def create
        current_listing = Listing.find(params[:id])
        new_review = current_listing.reviews.new(review_params)
        new_review.user_id = current_user.id
        if new_review.save
            redirect_to listing_path(params[:id])
        else
            render listing_path(params[:id])
        end
    end

    def edit
        @review = Review.find(params[:reviewid])
        if current_user != @review.user
            redirect_to listing_path(params[:id])
        end
    end

    def update
        review = Review.find(params[:reviewid])
        if review.update(review_params)
            redirect_to listing_path(params[:id])
        else
            render 'edit'
        end
    end

    def destroy
        review = Review.find(params[:reviewid]).destroy
        if current_user != review.user
            redirect_to listing_path(params[:id])
        end
        review.destroy
        redirect_to listing_path(params[:id])
    end

    private
        def review_params
            params.require(:review).permit(:review, :rating)
        end
end