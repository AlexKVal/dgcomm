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
