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
    authorize @boat
  end

  def edit
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def update
    @boat = Boat.find(params[:id])
    authorize @boat
    if @boat.update(boat_params)
    redirect_to boat_path(@boat)
    else
    render :edit
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.destroy
    redirect_to dashboard_path
  end

  private

  def boat_params
    params.require(:boat).permit(:description, :title, :boat_type, :price_per_day, :location)
  end
end
