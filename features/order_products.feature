Feature: Order Products
  In order to order products
  As a client
  I want to be able to select and order products

  Scenario: Browsing a list of products
    Given a product with the name "Ruby on Rails book"
    And a product with the name "Panasonic TV"
    When I go to path "/"
    Then I should see "Ruby on Rails book"
    And I should see "Panasonic TV"
