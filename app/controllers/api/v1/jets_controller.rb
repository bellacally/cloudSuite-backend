class Api::V1::JetsController < Api::V1::BaseController
  def index
    @jets = Jet.all
  end
end
