Given /^a product with the name "([^"]*)"$/ do |name|
  Product.create!(name: name)
end
