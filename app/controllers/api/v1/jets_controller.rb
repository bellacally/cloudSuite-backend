class Api::V1::JetsController < Api::V1::BaseController
  # tested all the api in postman, should work lol
  skip_before_action :verify_authenticity_token
  before_action :find_jet, only: [:show, :update, :destroy]

  def index
    sql_query = ""
    if params[:passengers].present?
      sql_query += "\
      capacity_of_passengers > :passengers \
      "
    end
    if params[:location].present?
      sql_query += "location ILIKE :location \
      "
    end
    if params[:start_date].present?
      sql_query += "
      available_start_date <= :start_date \
      available_end_date > :start_date \
      "
    end
      p sql_query
      @jets = Jet.where(sql_query, passengers: params[:passengers], location: params[:location], start_date: params[:start_date])
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
      render json: {
        id: @jet.id
      }
    else
      render_error
    end
  end

  def update
    # frontend should set the validation(the edit button), so no logic here
    if @jet.update(jet_params)
      # return created object, for validation or added status
      render :show
    else
      # return error message
      render_error
    end
  end

  def destroy
    @jet.destroy
    # no render so no added to status:, so use head to add stauts to head (no content)
    head :no_content
  end

  private

  def jet_params
    params.require(:jet).permit(:avatarurl, :price_jet, :location, :model, :photo, :description, :capacity_of_passengers, :category, :manufactory, :user_id, :available_start_date, :available_end_date)
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
