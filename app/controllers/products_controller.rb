class ProductsController < ApplicationController
  def index
  	spreadsheet = Roo::Spreadsheet.open("#{Rails.root}/public/products.csv")
	@header = spreadsheet.row(1)
	not_found = []
	@row = []
	(2..spreadsheet.last_row).each do |i|
		item = Hash[[@header, spreadsheet.row(i)].transpose]
 		@row << item
 	end
 	return @row


 	#using database
	# spreadsheet = Roo::Spreadsheet.open("#{Rails.root}/public/products.csv")
	# @header = spreadsheet.row(1)
	# Product.update_all(product_name: "", product_description: "", brand_name: "")
	# (2..spreadsheet.last_row).each do |i|
	# 	row = Hash[[@header, spreadsheet.row(i)].transpose]
	#     	Product.update(product_name: row["Product Name"], product_description: row["Product Description"], brand_name: ["Brand Name"])
 # 	end
 	
 # 	@products = Product.all
  end


  def destroy
  	spreadsheet = Roo::Spreadsheet.open("#{Rails.root}/public/products.csv")
  	@header = spreadsheet.row(1)
  	(2..spreadsheet.last_row).each do |i|
		item = Hash[[@header, spreadsheet.row(i)].transpose]
		byebug
 	end
  	
  end	
end
