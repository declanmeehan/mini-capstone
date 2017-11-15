require 'unirest'

response = Unirest.get("http://localhost:3000/products_all")

body = response.body

p body