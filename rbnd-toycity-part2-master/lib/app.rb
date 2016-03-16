require 'json'
def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end



def print_headers
# Print "Sales Report" in ascii art
	$report_file.write("Sales Report\n")
# Print today's date
$report_file.write(Time.now.strftime("%m/%d/%Y"))
end

def print_products
# Print "Products" in ascii art
$report_file.write("\n")
$report_file.write("                     _            _       \n")
$report_file.write("                    | |          | |      \n")
$report_file.write(" _ __  _ __ ___   __| |_   _  ___| |_ ___ \n")
$report_file.write("| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|\n")
$report_file.write("| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\\n")
$report_file.write("| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/\n")
$report_file.write("| |                                       \n")
$report_file.write("|_|                                       \n")
end


def calculate_products(products)
# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price
#Make iteration product wise 
   products["items"].each do |toy|
  #Define and initialize variables
    total_sale = 0
    avg_sale = 0
    discount = 0
    $report_file.write("Name: #{toy["title"]}\n")
    $report_file.write("Retail price of the toy: $#{toy["full-price"]}\n")
    $report_file.write("Total number of purchases: #{toy["purchases"].length}\n")
    #Calculating the total sale for each product
      toy["purchases"].each do |sale|
      	total_sale = total_sale + sale["price"]
      end    
  	$report_file.write("Total amount of sales: $#{total_sale}\n")
  	avg_sale = total_sale/toy["purchases"].length
  	$report_file.write("Avg. price that the toy sold for: $#{avg_sale}\n")
  	discount = toy["full-price"].to_f - avg_sale
  	$report_file.write("Average discount:$#{discount}\n")
  	$report_file.write("Average discount percentage: #{((discount*100)/toy["full-price"].to_f).round(2)}\n")
  	$report_file.write("\n")
  	end
end

def print_brands
# Print "Brands" in ascii art
	$report_file.write(" _                         _     \n")
	$report_file.write("| |                       | |    \n")
	$report_file.write("| |__  _ __ __ _ _ __   __| |___ \n")
	$report_file.write("| '_ \\| '__/ _` | '_ \\ / _` / __|\n")
	$report_file.write("| |_) | | | (_| | | | | (_| \\__ \\\n")
	$report_file.write("|_.__/|_|  \\__,_|_| |_|\\__,_|___/\n")
end

def calculate_brands(products)
# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined
	#Let's try to find all the unique brands since there might be repetations, then use that information to extract brand wise data

# find all unique brands
brand_unique = products["items"].uniq {|e| e["brand"]}

#Number of unique brands
len = brand_unique.length

#To calculate the total revenue combined
total_revenue = 0

#define and initialize counter for the loop
i=0

len.times do
  #variables
  stock = 0
  total_price = 0.00
  total_revenue = 0.00
  #how many times a brand occurs - to calculate average
  count = 0
  $report_file.write(brand_unique[i]["brand\n"])
  products["items"].each do |toy|
    if toy["brand"] == brand_unique[i]["brand"]
      stock = stock + toy["stock"]
      total_price = total_price + toy["full-price"].to_f
      count = count + 1
      #Calculating the total sale for each product
      toy["purchases"].each do |sale|
       total_revenue = total_revenue + sale["price"]
      end 
    end 

  end
  $report_file.write("Total stock: #{stock}\n")
  $report_file.write("Average price of the brand's toy: $#{total_price.round(2)/count}\n")
  $report_file.write("Total revenue of all the brand's toy sales combined: $#{total_revenue.round(2)}\n")
  i = i + 1
  $report_file.write("\n")
end

end


def create_report
	print_headers
	print_products
	calculate_products($products_hash)
	print_brands
	calculate_brands($products_hash)
end

setup_files
create_report



