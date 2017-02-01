class UserController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @current_user = current_user
    @products = Product.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10)
    Product
  end

  def show
  end

end
