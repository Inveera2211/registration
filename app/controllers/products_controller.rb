
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

  end

def create
    file = "#{Rails.root}/public/products.csv"
    header = ["Product Name","Product Description", "Brand Name"]
    CSV.open(file,"a") do |csv|
    row = CSV::Row.new(header,[])
    row["Product Name"] = params[:pn]
    row["Product Description"] = params[:pd]
    row["Brand Name"] = params[:bn]
    csv << row
    end
    redirect_to products_path
end 


  def update
  	file = "#{Rails.root}/public/products.csv"
  	spreadsheet = Roo::CSV.new(file)
  	row = params[:row].to_i

  (1..3).each do |count|
    column = count
    if (count ==1)
      data = params[:pn]
    elsif(count == 2)
      data = params[:pd]
     else
      data = params[:bn]
     end 
    	spreadsheet.set(row, column,data, nil)

    	CSV.open(file, 'w' ) do |writer|
    		spreadsheet.to_a.each_with_index do |a, index|
  			 writer << a
  		  end
  	  end
  end
    redirect_to products_path
  end


  def destroy
  	file = "#{Rails.root}/public/products.csv"
  	spreadsheet = Roo::Spreadsheet.open("#{Rails.root}/public/products.csv")
  	@header = spreadsheet.row(1)
  	data = spreadsheet.to_a
  	data.delete_at(params[:row_id].to_i - 1)
  	CSV.open(file, 'w' ) do |writer|
  		data.each_with_index do |a, index|
			writer << a
		end
	end
	redirect_to products_path
	end
end	
