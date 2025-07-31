@example
Feature: As a customer I should be able to edit the contents of my shopping basket, change quantities and then checkout

    Background:
        Given I have the following data:
            | Product | Stock | Basket |
            | 1       | 2     | 0      |
            | 2       | 0     | 0      |
            | 3       | 2     | 1      |


    Scenario Outline: testing functionality of basket
        Given I am on the product detail page of product <product>
        When I click the Add to Basket button
        Then the quantities are
            | Stock   | Basket   |
            | <stock> | <basket> |
        And a message <message> is displaye to the user

        Examples:
            | Description       | Product | Stock | Basket | Message               |
            | In Stock          | 1       | 1     | 1      | 'Added to the basket' |
            | Not In Stock      | 2       | 0     | 0      | 'Not in stock'        |
            | Already in Basket | 3       | 3     | 2      | 'Limited to one only' |

    Scenario: As a customer I can add an item to my shopping basket
        Given I am on the product detail page of product "1"
        When I click the Add to Basket button
        Then product "1" has the following quantities:
            | Stock | Basket |
            | 1     | 1      |
        And a message is displayed to the user

    # product is not in stock and not in the basket
    @ignore
    Scenario: As a customer I am unable to add an item to my shopping basket if not in stock
        Given I am on the product detail page of product "2"
        When I click the Add to Basket button
        Then product "2" has the following quantities:
            | Stock | Basket |
            | 0     | 0      |
        Then a message is displayed to the user

    # product is in stock and in the basket
    @example
    Scenario: As a customer I am unable to add an item to my shopping basket if it's already in the basket
        Given I am on the product detail page of product "3"
        When I click the Add to Basket button
        Then a message is displayed to the user
        Then product "3" has the following quantities:
            | Stock | Basket |
            | 3     | 2      |
        Then a message is displayed to the user
        

    @example
    @shipping
    Scenario: As a user I should be able to login to my account using my credentials
        Given the user is on the login page
        And the signin button is displayed
        When the user enters their username
        And the user enters their password
        And the user clicks the login button
        Then the user is authenticated
        And the user is on the account page

    # as a customer I can create a new account if I enter my username/password and click the register button, I will be sent to the account page
    Scenario: As a customer I can create a new account
        Given I am on the register screen
        When I enter my username
        And I enter my password
        And I click the register button
        Then I am sent to the account screen


    Scenario: As a customer I can remove an item from my shopping basket
        Given I am on the basket page
        When I click the remove button
        Then the product is removed from the basket

    Scenario: As a customer I can view the items of my shopping basket
        Given I am on the home page
        When I click the shopping basket icon
        Then I see a list of shopping items

    Scenario: As a customer I can checkout from the shopping basket
        Given I am on the basket page
        When I click the checkout button
        Then I should be taken to the checkout page

