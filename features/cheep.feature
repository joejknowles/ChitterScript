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