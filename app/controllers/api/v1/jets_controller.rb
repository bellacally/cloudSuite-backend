class Api::V1::JetsController < Api::V1::BaseController
  before_action :find_jet, only: [:show]

  def index
    @jets = Jet.all
  end

  def show
  end

  private

  def find_jet
    @jet = Jet.find(params[:id])
  end
end
