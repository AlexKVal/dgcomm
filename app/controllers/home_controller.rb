class HomeController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 9, order: :name)
  end
end
