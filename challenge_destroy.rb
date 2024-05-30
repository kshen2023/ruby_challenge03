load 'ar.rb'

# Find one of the products you created in challenge_create.rb.
# Replace 'Product 1' with the actual name of the product you created.
product = Product.find_by(name: 'hahaha')

if product
  # Delete it from the database.
  product.destroy
  puts "Product '#{product.name}' has been deleted."
else
  puts "Product not found."
end