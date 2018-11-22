class Api::V1::ReservationsController < Api::V1::BaseController
  # tested all the api in postman, should work lol
  skip_before_action :verify_authenticity_token
  before_action :find_reservation, only: [:show, :update, :destroy]

  def show
  end

  def create
    # pass current user in json format from MP
    @user = User.find(user_params)
    @jet = Jet.find(params[:jet_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.total_price = @jet.price_jet * (@reservation.end_date - @reservation.start_date)
    @reservation.user = @user
    @reservation.jet = @jet
    if @reservation.save
      # return created object, for validation or added status (created 20X)
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    # frontend should set the validation(the edit button), so no logic here
    if @reservation.update(reservation_params)
      # return created object, for validation or added status
      render :show
    else
      # return error message
      render_error
    end
  end

  def destroy
    @reservation.destroy
    # no render so no added to status:, so use head to add stauts to head (no content)
    head :no_content
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customized_request, :status, :start_date, :end_date, :destination, :number_of_passengers, :passenger_identifications, :total_price, :start_time, :end_time)
  end

  def user_params
    params[:user][:id]
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def render_error
    render json: { errors: @reservation.errors.full_messages },
      status: :unprocessable_entity
  end
end
