class OffersController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

end
