class AddPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal, :precision => 8
    change_column :products, :price, :decimal, :precision => 8
    LineItem.reset_column_information
    
    LineItem.all.each do |li|
      li.price = li.product.price if li.product
    end
  end
  def self.down
    remove_column :line_items, :price
  end
end

