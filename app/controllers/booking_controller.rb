class BookingController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookings = current_user.bookings.all
  end

  def payments
      temp = current_user.bookings.new(params.require(:booking).permit(:time))
      temp.listing_id = params[:id]
      if temp.save
          @listing = Listing.find(params[:id])
          @listing.update_booking
      else
          redirect_to Listing.find(params[:id])
      end 
  end
end


def get_stripe_id
    @listing = Listing.find(params[:id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.address,
        description: @listing.description,
        amount: @listing.price * @listing.bookings.last.time,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: @listing.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    ).id
    render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end
  