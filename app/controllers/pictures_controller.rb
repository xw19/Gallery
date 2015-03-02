class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :own_user?, only: [:edit, :update, :destroy]

  def index
    @q = Picture.ransack(params[:q])
    @pictures = @q.result(distinct: true).includes(:comments).paginate(page: params[:page], per_page: 9)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    if @picture.save
      flash[:success] = "Picture created successfully"
      redirect_to @picture
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.friendly.find(params[:id])
    if @picture.update(picture_params)
      flash[:success] = "picture updated"
      redirect_to @picture
    else
      render 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:warning] = "picture destroyed"
    redirect_to categories_path
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments.paginate(page: params[:page], per_page: 5).order("created_at DESC")
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :description, :photo, :category_id)
  end



end
