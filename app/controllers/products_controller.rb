class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show ]
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @product = Product.all
    @current_user = current_user
  end

  def show
    @product = Product.find(params[:id])
    @current_user = current_user
  end

  def new
      @categories = Category.all
      @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :location, :image, :category_id )
    end
end
