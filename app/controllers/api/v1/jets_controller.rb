class Api::V1::JetsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :find_jet, only: [:show]

  def index
    @jets = Jet.all
  end

  def show
  end

  def create
    # pass current user in json format from MP
    @user = User.find(user_params)
    @jet = Jet.new(jet_params)
    @jet.user = @user
    if @jet.save
      # return created object, for validation or added status (created 20X)
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    # frontend should set the validation(the edit button), so no logic here
    if @restaurant.update(restaurant_params)
      # return created object, for validation or added status
      render :show
    else
      # return error message
      render_error
    end
  end

  private

  def jet_params
    params.require(:jet).permit(:location, :model, :photo, :description, :capacity_of_passengers, :category, :manufactory, :user_id, :available_start_date, :available_end_date)
  end

  def user_params
    params[:user][:id]
  end

  def find_jet
    @jet = Jet.find(params[:id])
  end

  def render_error
    render json: { errors: @jet.errors.full_messages },
      status: :unprocessable_entity
  end
end
