Feature: Admin managing Products

  Scenario: View list of products as Admin
    Given a product with the name "Ruby on Rails book"
    And a product with the name "Panasonic TV"
    When I go to path "/admin/products"
    Then I should see "Ruby on Rails book"
    And I should see "Panasonic TV"

  Scenario: Edit product
    Given a product with the name "Ruby on Rails book"
    When I go to path "/admin/products"
    And follow "Ruby on Rails book"
    When I fill in "Product name" with "apache baseball cap 99"
    When I press "Update"
    Then I should see "successfully updated!"
