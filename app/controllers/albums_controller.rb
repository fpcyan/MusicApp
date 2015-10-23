require 'byebug'
class AlbumsController < ApplicationController
  before_action :ensure_signed_in

  def show
    @album = Album.includes(:tracks).find(params[:id])
    render :show
  end

  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    band_id = Band.find_by(name: params[:bands][:name]).id
    @album = Album.new(album_params.merge(band_id: band_id))

    if @album.save
      flash.now[:notice] = "Album successfully created!"
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  @bands = Band.all
  @album = Album.includes(:band).find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:notice] = "Successfully updated."
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
    end
  end

  def destroy
  @album = Album.find(params[:id])
    @band = @album.band
    if @album.delete
      flash.now[:notice] = "Album DELETED!"
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = "Failed"
      redirect_to :show
    end
  end

  private

    def album_params
      params.require(:albums).permit(:title, :rtype)
    end
end
