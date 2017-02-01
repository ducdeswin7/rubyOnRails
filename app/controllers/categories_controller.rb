class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to category_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

  def authenticate_admin
    redirect_to '/', alert: 'Not authorized to this page.' unless current_user && access_whitelist
  end

  def access_whitelist
    current_user.try(:admin?) || current_user.try(:door_super?)
  end
end
