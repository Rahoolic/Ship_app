class BoatsController < ApplicationController
  def index
    @boats = policy_scope(Boat).order(created_at: :desc)
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat
  end
end
