# Load the Rails environment
require_relative 'ar.rb'

# Find all categories
categories = Category.all

# Iterate through each category
categories.each do |category|
  puts "Category: #{category.name}"
  puts "Associated Products:"
  
  # Find associated products for the current category
  products = category.products
  
  # Display product names and prices
  products.each do |product|
    puts "- #{product.name}: $#{product.price}"
  end
  
  puts "\n"  # Add a newline for readability
end
