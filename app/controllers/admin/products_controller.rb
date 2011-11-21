class Admin::ProductsController < Admin::BaseController
  # GET /admin/products
  def index
    @products = Product.all
  end

  # GET /admin/products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # PUT /admin/products/1
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path, notice: "Successfully updated!"
    else
      render :edit, alert: "Successfully updated!"
    end
  end
end
