class StoreController < ApplicationController
  
  def index
   render :text => 'hello world'
    @products = Product.find_products_for_sale
  end
end
