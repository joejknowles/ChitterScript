Feature: User signs up for Chitter
  In order to use chitter
  As a social creature
  I want to sign up

  Background:
    Given "joejknowles" signs up

  Scenario: Sees welcome message
    Then I see "Hello, joejknowles"

  Scenario: Forms dissappears
    Then I don't see "Register"
    Then I don't see "Sign in"

  Scenario: Sign  with existing username
    When I sign out
    And "joejknowles" signs up
    Then I see "Username is already taken"

  Scenario: Don't see sign out when not signed in
    When I sign out
    Then I don't see "Sign out"