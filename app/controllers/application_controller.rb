class ApplicationController < ActionController::Base
  protect_from_forgery

  #private methods available to other controllers
  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart 
  end

   def increment_count
    if session[:counter].nil?
       session[:counter] = 0
    end
    session[:counter] += 1
  end

   def decrement_count
     session[:counter] = 0 if session[:counter] > 0
   end
end
