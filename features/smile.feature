Feature: Smiling
  In order to express my feelings twords a cheep
  As a user
  I would like to be able to smile at posts

  Background:
    Given "joejknowles" signs up
    When I cheep "First! No, like, actually first."

  Scenario: 0 smiles to begin with
    Then I see 0

  Scenario: Adds a smile when smile clicked
    When I click smile
    Then I see "1" within ".smiles__number"

  Scenario: removes a smile when same smile clicked again
    When I click smile
    And I click smile
    Then I see "0" within ".smiles__number"