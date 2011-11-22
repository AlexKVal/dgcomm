Feature: Admin managing Products

  Scenario: View list of products as Admin
    Given a product with the name "Ruby on Rails book"
    And a product with the name "Panasonic TV"
    When I go to path "/admin/products"
    Then I should see "Ruby on Rails book"
    And I should see "Panasonic TV"

  Scenario: Edititing product
    Given a product with the name "Ruby on Rails book"
    When I go to path "/admin/products"
    And follow "Ruby on Rails book"
    When I fill in "product_name" with "apache baseball cap 99"
    When I press "Update"
    Then I should see "Successfully updated"

  Scenario: Deleting product
    Given a product with the name "Ruby on Rails book"
    When I go to path "/admin/products"
    And follow "Remove"
    Then I should see "Product has been deleted"

  Scenario: Adding a new product
    When I go to path "/admin/products"
    And follow "Add a new product"
    When I fill in "product_name" with "Ruby on Rails book"
    When I press "Create"
    Then I should see "Product was successfully added"

  Scenario: A product's name should be unique
    Given a product with the name "Ruby on Rails book"
    When I go to path "/admin/products"
    And follow "Add a new product"
    When I fill in "product_name" with "Ruby on Rails book"
    When I press "Create"
    Then I should see "has already been taken"
