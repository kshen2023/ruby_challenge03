require_relative 'ar.rb'

# use the Product class to find (any) product from the database.
product = Product.first
puts "Fisrt product is #{product.inspect}"

# Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

# The names of all products above $10 with names that begin with the letter C
products_above_10 = Product.where('price > ? AND name LIKE ?', 10, 'C%')
puts "The names of all products above $10 with names that begin with the letter C:"
products_above_10.each { |product| puts product.name }

# Total number of products with a low stock quantity. (Low is defined as less than 5 in stock.)
low_stock_quantity_products = Product.where('stock_quantity < ?', 5).count
puts "Total number of products with a low stock_quantity quantity: #{low_stock_quantity_products}"

# Find the name of the category associated with one of the products you have found.
product = Product.first
puts "Category of the first product: #{product.category.name}"

# Find a specific category and use it to build and persist a new product associated with this category.
category = Category.find_by(name: 'Beverages') 
new_product = category.products.build(name: 'wahaha', price: 668, stock_quantity: 688, description: '好喝') # Replace with actual column names and values
if new_product.save
  puts "New product '#{new_product.name}' has been created in the '#{category.name}' category."
else
  puts "Failed to create new product: #{new_product.errors.full_messages.join(", ")}"
end

# Find a specific category and then use it to locate all the the associated products over a certain price.

minimum_price = 100
products_in_category_over_price = category.products.where("price > ?", minimum_price)

if products_in_category_over_price.empty?
  puts "No products found in the category '#{category}' over the price of #{minimum_price}."
else
  puts "Products in the category '#{category.name}' over the price of #{minimum_price}:"
  products_in_category_over_price.each do |product|
    puts "#{product.name}: $#{product.price}"
  end
end