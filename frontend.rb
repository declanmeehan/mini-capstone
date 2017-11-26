require 'unirest'
require 'tty-table'
require 'tty-prompt'
require 'pp'

system "clear"

params = {}

puts "Please enter a number:"
puts "[1] show all products"
puts "[1.1] search products by name" 
puts "[1.2] search products by price" 
puts "[2] create a product"
puts "[3] show a product"
puts "[4] update a product"
puts "[5] delete a product"
answer_crud = gets.chomp

if answer_crud == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  body = response.body
  pp body
elsif answer_crud == "1.1"
  print "enter product name: "
  search_name = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?search=#{search_name}")
  product = response.body
  pp product
elsif answer_crud == "1.2"
  print "enter product price: "
  response_price = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?search_price=#{response_price}")
  product = response.body
  pp product
elsif answer_crud == "2"
  print "enter product name: "
  params["name"] = gets.chomp
  print "enter product price: "
  params["price"] = gets.chomp
  print "enter product image: "
  params["image"] = gets.chomp
  print "enter product Description: "
  params["description"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
  body = response.body
  pp body
elsif answer_crud == "3" 
  puts "please enter an id number"
  answer_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{answer_id}")
elsif answer_crud == "4"
  params = {}
  print "enter a the product id that you would like to update: "
  answer_update = gets.chomp
  print "enter product name: "
  params["name"] = gets.chomp
  print "enter product price: "
  params["price"] = gets.chomp
  print "enter product image: "
  params["image"] = gets.chomp
  print "enter product Description: "
  params["description"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/v1/products/#{answer_update}", parameters: params)
  body = response.body
  pp body
elsif answer_crud == "5"
  print "what product would you like to delete? "
  answer_delete = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{answer_delete}")
else 
  puts "Next time enter a valid number you dummy"
end
  









# response = Unirest.get("http://localhost:3000/products_all")

# body = response.body

# i = 0

# number_list = ["a1", "a2", "a3"]

# 3.times do
#   number_list[i] = body[i]["name"]
#   i += 1
# end

#p number_list

#p body

#table = TTY::Table.new ['Name','Price', 'Image', 'Description'] , [[a1, a2], ['b1', 'b2']]

#puts table.render(:ascii)