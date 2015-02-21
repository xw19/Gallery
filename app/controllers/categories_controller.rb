class CategoriesController < ApplicationController
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
      flash.now[:failure] = "Some error occured"
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @catergory.update(category_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      flash.now[:faliure] = "Some error occured"
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
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :purity)
  end


end
