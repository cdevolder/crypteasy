class AlertsController < ApplicationController
  def new
    @favorite = Favorite.find(params[:favorite_id])
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.favorite = Favorite.find(params[:favorite_id])
    @alert.user = current_user
    if @alert.save
      redirect_to favorite_alerts_path
    else
      render :new
    end
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def index
    @alerts = Alert.where("favorite_id = '#{params[:favorite_id]}'")
  end

  def destroy

    Alert.find(params[:id]).destroy
    redirect_to favorite_alerts_path
  end

  def alert_params
    params.require(:alert).permit(:option, :price)
  end
end
