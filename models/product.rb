class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

    # Validations
    validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
    validates :description, presence: true
    validates :price, presence: true
    validates :stock_quantity, presence: true
end
# In a comment within your product.rb file, record all the columns that exist in the products table. 
# Product id:, name, description, price, stock_quantity, category_id

# Based on the columns you find, can you determine if the products table has an association with any other tables? If so, what table?
# category table 

