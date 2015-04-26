Feature: CHEEPING
  In order to share my thoughts
  As a fascinating person
  I want to be able to cheep to the world

  Background:
    Given "joejknowles" signs up

  Scenario: Posts a cheep
    When I cheep "First! No, like, actually first."
    Then I see "joejknowles cheeped:"
    And I see "First! No, like, actually first."

  Scenario: Cheeps persist on refresh
    When I cheep "First! No, like, actually first."
    And I am on the home page
    Then I see "joejknowles cheeped:"
    And I see "First! No, like, actually first."

  Scenario: Only see 10 cheeps until I press load more
    When I cheep "Lost and found cheep :)"
    And I cheep "First! No, like, actually first." ten times
    And I am on the home page
    Then I see "First! No, like, actually first."
    And I don't see "Lost and found cheep :)"
    When I press "Load More" button
    Then I see "Lost and found cheep :)"