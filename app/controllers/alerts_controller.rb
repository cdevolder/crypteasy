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
      redirect_to favorite_path(@alert.favorite)
    else
      render :new
    end
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
