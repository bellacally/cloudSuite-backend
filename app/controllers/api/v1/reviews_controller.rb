class Api::V1::ReviewsController < Api::V1::BaseController
   skip_before_action :verify_authenticity_token

  def create
    @reservation = Reservation.find(params[:reservation_id])


    @review = Review.new(review_params)
    @review.reservation = @reservation
    if @review.save
        render json: {
          review: @review
        }
    else
      render_error
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :photo, :reservation_id)
  end

  def render_error
    render json: { errors: @review.errors.full_messages },
      status: :unprocessable_entity
  end
end
