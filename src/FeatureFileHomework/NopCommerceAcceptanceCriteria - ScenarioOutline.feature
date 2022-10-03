Feature: Bookcategory

  Background: I should be able to see homepage
    Given I enter Url " https://demo.nopcommerce.com/" in browser
    And   I am on homepage

Scenario Outline: I should be able to see top manu tabs on homepage with categories
  When I am on homepage
  Then I should be able to see top manu tabs with "<categories>"

  Examples:
    | Categories        |
    | Computer          |
    | Electronics       |
    | Appareal          |
    | Digital downloads |
    | Books             |
    | Jewelerry         |
    | GIft card         |

  Scenario Outline: I should be able tko see book page with filters
    When  I select book category from top mrnu tabs on home page
    Then  I should be navigated to book category
    And   I should be able to see "<filters>"
    Examples:
      | Filters  |
      | Short by |
      | Display  |
      | The Grid |
      | List Tab |

    Scenario Outline: I should be able to see list of terms of each filtesr
      Given I am on book page
      When  I click on "<filter>"
      Then  I should be able to see "<list>" in dropdown menu

      Examples:
        | Filter  | List                                                                               |
        | sort by | Name: A to Z, Name : Z to A, Price : Low to High, Price : High to Low, Created on, |
        | Display | 3,6,9                                                                              |

      Scenario Outline: I should be able to choose any filter option with specific result
        Given I am on book page
        When  I click on "<filter>"
        And   I click on any "<option>"
        And   I should be able to choose any filter option from list
        Then  I should be able to see "<result>"
        Examples:
          | Filter  | Option              | Result                                                              |
          | Sort by | Name : A to Z       | sorted products with the products name in alphabetic order "A to Z" |
          | Sort by | Name : Z to A       | sorted products with the products name in alphabetic order "Z to A" |
          | Sort by | Price : Low to High | sorte products with the price in descending order                   |
          | Sort by | Price : High to Low | sorted products with th wprice in ascending order                   |
          | Sort by | Created on          | Recently added products should be show first                        |
          | Display | 3                   | 3 produsts in a page                                                |
          | Display | 6                   | 6 products in a page                                                |
          | Display | 9                   | 9 products in a page                                                |

        Scenario Outline: I should be able to see product display format according display format type as Grid or List
          Given  I am on book page
          When   I click on "<display format icon>"
          Then   I should be able to see product dispaly according display format type as per given format
          Examples:
            | Display format icon |
            | Grid                |
            | List                |
