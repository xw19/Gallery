class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :own_user?, only: [:edit, :update, :destroy]

  def index
    @albums = Album.order('created_at DESC').page(params[:page])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to @album, notice: 'Album created'
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @album.save
      redirect_to @album, notice: 'Album created'
    else
      render "new"
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path, notice: 'album destroyed'
  end

  def show
    @album = Album.find(params[:id])
    @pictures = @album.pictures.page(params[:page])
  end

  private

  def album_params
    params.require(:album).permit(:name, :about)
  end

  def own_user?
    @album = Album.find(params[:id])
    unless @album.user == current_user
      redirect_to @album, alert: "You dont have permission to edit/destroy"
    end
  end
end
