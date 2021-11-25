class PagesController < ApplicationController
  def home
  end

  def dashboard
    @yachts = current_user.boats
  end
end
