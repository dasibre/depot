require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 def setup
   @cart = Cart.create
   @book_one = products(:ruby)
   @book_two = products(:two)
 end

 test "add_unique products"do
   @cart.add_product(@book_one.id).save!
   @cart.add_product(@book_two.id).save!
   assert_equal 2, @cart.line_items.size
   assert_equal @book_one.price + @book_two.price, @cart.total_price
 end
 
    test "add_duplicate_product" do
      @cart.add_product(@book_one.id).save!
      @cart.add_product(@book_one.id).save!
      assert_equal 1, @cart.line_items.size
      assert_equal 2, @cart.line_items[0].quantity
   end 
  end
