class BoatsController < ApplicationController
  def index
    @boats = policy_scope(Boat).order(created_at: :desc)

    # @markers = @boats.geocoded.map do |boat|
    #   {
    #     lat: boat.latitude,
    #     lng: boat.longitude
    #   }
    # end
  end

  def show
    @boat = Boat.find(params[:id])
  end

end
