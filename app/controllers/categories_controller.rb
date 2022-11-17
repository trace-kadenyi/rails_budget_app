class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    # categories of the current user
    @categories = current_user.categories.order('created_at DESC')
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    redirect_to categories_path, notice: 'Category deleted.'
  end

  def category_params
    params.require(:category).permit(:name, :icon, :description)
  end
end
