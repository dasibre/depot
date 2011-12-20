require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  product = Product.new(:title => "Going home", :description => "Testing price value", :image_url => "abcd.jpg")
  assert product.price = -1
  assert product.invalid?
  assert_equal "must be greater than or equal to 0.01",
    product.errors[:price].join(';')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join(';')

    product.price = 1
    assert product.valid?
  end
#Create new product method
  def new_product(image_url)
    Product.new(:title => "My books", :description => "yynnss", :price => 1, :image_url => image_url)
  end
  #Test image url
  test "url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
    end

  test "image_url_1" do
    product = Product.new(:title => "abcd", :description => "Testing image url", :price => 1 )
    product.image_url = "products"
    assert product.invalid?
  end

  test "image_url_2" do
      product = Product.new(:title => "abcd", :description => "Testing image url", :price => 1 )
      product.image_url = "img.jpg"
      assert product.valid?
  end

 test "product not valid with out unique title" do
   product = Product.new(:title       => products(:ruby).title,
                         :description => "yyy",
                         :price       => 1,
                         :image_url   => "fred.jpg")
   assert !product.save
   assert_equal "has already been taken", product.errors[:title].join(';')
 end
 end