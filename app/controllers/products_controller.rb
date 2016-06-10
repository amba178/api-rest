class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update, :destroy]
	
  def index
  	@products = Product.all.includes(:category)
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to @product, success: "Product was successfully created."
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @product.update_attributes(product_params)
  		redirect_to @product, success: "Product was successfully updated."
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@product.destroy
  	redirect_to products_url, success: "Product was destroy."
  end

  private 
  	def product_params
  		params.require(:product).permit(:name, :price, :released_on, :category, :category_id)
  	end

  	def find_product
  		@product = Product.find(params[:id])
  	end
end
