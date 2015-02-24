class CategoriesController < ApplicationController
  before_action :check_admin

  def index
    @categories = Category.order('name asc')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully"
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @catergory.update(category_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:warning] = "Category destroyed"
    redirect_to categories_path
  end

  def show
    @category = Category.friendly.find(params[:id])
    @pictures = @category.pictures
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :purity)
  end

  def check_admin
    unless is_admin?
      flash[:alert] = "Access Denied"
      redirect_to root_path
    end
  end
end
