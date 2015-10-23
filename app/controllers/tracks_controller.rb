class TracksController < ApplicationController
  before_action :ensure_signed_in

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def create
    album_id = Album.find_by(name: params[:albums][:name]).id
    @track = Track.new(track_params.merge(album_id: album_id))

    if @track.save
      flash.now[:notice] = "Track successfully created!"
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
  @albums = Album.all
  @track = Track.includes(:album).find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:notice] = "Successfully updated."
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
    end
  end

  def destroy
  @track = Track.find(params[:id])
    @album = @track.album
    if @track.delete
      flash.now[:notice] = "Track DELETED!"
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = "Failed"
      redirect_to :show
    end
  end

  private

    def track_params
      params.require(:tracks).permit(:title, :rtype)
    end
end
