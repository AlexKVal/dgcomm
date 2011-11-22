class Admin::ProductsController < Admin::BaseController
  # GET /admin/products
  def index
    @products = Product.paginate(page: params[:page], per_page: 10, order: :name)
  end

  # GET /admin/products/new
  def new
    @product = Product.new
    #redirect_to admin_products_path
  end

  # POST /admin/products
  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to admin_products_path, :notice => 'Product was successfully added.'
    else
      render :new
    end
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

  # DELETE /admin/products/1
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: "Product has been deleted!"
  end
end
