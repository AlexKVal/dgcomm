When /^I go to path "([^"]*)"$/ do |path|
  visit(path)
end

Then /^I should see "([^"]*)"$/ do |text|
  #page.should have_content(text)
  assert page.has_content?(text)
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^follow "([^"]*)"$/ do |text|
  click_link(text)
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end
