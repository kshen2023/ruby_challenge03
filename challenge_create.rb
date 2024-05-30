load 'ar.rb'

# Create three new products using the three different ways to create new AR objects.

# set the product to a category
category = Category.first

# Method One: Create a Product in "object space".
product1 = Product.new
product1.name = 'hahaha'
product1.price = 666
product1.stock_quantity = 888
product1.category = category
product1.description = 'happy drink'
product1.save

# Method Two: Create a Product in "object space"
product2 = Product.new(name: 'xixixi', price: 668, stock_quantity: 886, category: category, description: 'joy')
product2.save

# Method Three: Create the object and persist it all at once.
product3 = Product.create(name: 'miaomiaomiao', price: 999, stock_quantity: 999, category: category, description: 'pleasure')

# Create a Product object that is missing some required columns.
invalid_product = Product.new(name: 'wangwangwang', price: 999, stock_quantity: 999, category: category)

 # Try to save the product
 if invalid_product.save
    puts "Product created successfully: #{invalid_product.inspect}"
  else
    puts "Failed to create product. Errors:"
    invalid_product.errors.full_messages.each do |error|
      puts error
    end
  end
end
