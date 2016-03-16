require 'json'
def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end



def print_headers
# Print "Sales Report" in ascii art
	report_file.write("Sales Report\n")
# Print today's date
report_file.write(Time.now.strftime("%m/%d/%Y"))
end

def print_products
# Print "Products" in ascii art
report_file.write("                     _            _       ")
report_file.write("                    | |          | |      ")
report_file.write(" _ __  _ __ ___   __| |_   _  ___| |_ ___ ")
report_file.write("| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|")
report_file.write("| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\")
report_file.write("| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/")
report_file.write("| |                                       ")
report_file.write("|_|                                       ")
end




# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art

# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined


def create_report
	print_headers
	print_products
	calculate_products($products_hash)
	write_products
	print_brands
	calculate_brands($products_hash)
	write_brands
end



