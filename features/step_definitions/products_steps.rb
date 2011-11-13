Given /^a product with the title "([^"]*)"$/ do |name|
  Product.create!(:name => name)
end

When /^I am on the home page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end