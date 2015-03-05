class PersonalsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :check_user, only: [:edit, :update, :destroy]

  def new
    @personal = current_user.build_personal
  end

  def create
    @personal = Personal.new(personal_params)
    @personal.user = current_user

    if @personal.save
      redirect_to @personal, alert: "Personal created"
    else
      render 'new'
    end
  end

  def show
    @personal = Personal.find(params[:id])
    @pictures = @personal.user.pictures.page(params[:page])
  end

  def edit
  end

  def update
    @personal.update_attributes(personal_params)
    if @personal.save
      redirect_to @personal, notice: "Personal updated"
    else
      render 'edit'
    end
  end

  def destroy
    @personal.destroy
    redirect_to root_path
  end


  private

  def personal_params
    params.require(:personal).permit(:first_name, :last_name, :date_of_birth, :avatar, :gender, :about_me)
  end

  def check_user
    @personal = Personal.find(params[:id])
    unless current_user === @personal.user
      redirect_to root_path, alert: "you are not allowed to edit/delete other profiles"
    end
  end
end
