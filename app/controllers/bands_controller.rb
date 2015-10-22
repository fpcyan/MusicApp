class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.includes(:albums, :tracks).find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash.now[:notice] = "Band successfully created!"
      redirect_to band_url(@band.id)
    else
      flash.now[:errors]
      render :new
    end
  end

  def edit
  @band = Band.find(params[:id])
    render :edit
  end

  def update
  end

  def destroy
    if Band.find(params[:id]).delete
      flash.now[:notice] = "BAND DELETED!"
      redirect_to bands_url
    else
      flash.now[:errors] = "Failed"
      redirect_to :show
    end
  end

  private

    def band_params
      params.require(:bands).permit(:name)
    end
end
