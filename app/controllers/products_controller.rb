class ProductsController < ApplicationController
# GET /products
  def index
    @products = Product.all

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @product}
    end
  end

  #show product by id
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.xml {render :xml => @product}
    end
  end

  #Get new products/new
  def new
    @product = Product.new

    respond_to do |format|
      format.html #new.html.erb
      format.xml {render :xml => @product}
    end
  end
  #Get products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice]= 'Product saved successfully'
        format.html {redirect_to (@product)}
        format.xml {render :xml => @product.errors, :status => :unprocessable_entity}
      else
        format.html {render :action => "new"}
        format.xml { render :xml => @product.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = "Product was successfully updated"
        format.html {redirect_to(@product)}
        format.xml { head :ok}
      else
        format.html { render :action => "edit"}
        format.xml { render :xml => @product.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml { head :ok}
    end
  end
end
