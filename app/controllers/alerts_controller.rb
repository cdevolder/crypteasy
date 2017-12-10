class AlertsController < ApplicationController
  def new
    @alert = Alert.new
  end

  def create
    @alert.favorite = Favorite.find(params[:favorite_id])
    @alert.user = current_user
    @alert.option = alert_params[:option]
    @alert.price = alert_params[:price]
  end

  def edit
  end

  def update
  end

  def message
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def index
    @alerts = Alert.all
  end

  def destroy
    @alert.destroy
  end

  def alert_params
    params.require(:alert).permit(:option, :price)
  end
end
