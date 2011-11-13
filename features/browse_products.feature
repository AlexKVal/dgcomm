Feature: Browse products
  In order to choose products to buy
  As a visitor
  I want to see a list of products

  Scenario: Browsing a list of products
    Given a product with the name "Ruby on Rails book"
    And a product with the name "Panasonic TV"
    When I am on the home page
    Then I should see "Ruby on Rails book"
    And I should see "Panasonic TV"
