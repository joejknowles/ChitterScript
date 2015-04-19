Feature: User auth
  So that I can have a secure account
  As a private kind of person
  I want to sign in and sign out securely

  Background:
    Given "joejknowles" signs up

  Scenario: Sign out
    When I sign out
    Then I see "Bye, joejknowles"

  Scenario: Sign in
    And I sign out
    When I sign in as "joejknowles"
    Then I see "Hello again, joejknowles"

  Scenario: Forms dissappear
    And I sign out
    When I sign in as "joejknowles"
    Then I don't see "Register"
    Then I don't see "Sign in"

  Scenario: Rejects incorrect details
    And I sign out
    And I sign in with incorrect details
    Then I see "Incorrect username or password"

  Scenario: Still signed in on refresh
    When I am on the home page
    Then I see "Hello again, joejknowles"

  Scenario: Forms hidden on refresh
    When I am on the home page
    Then I don't see "Register"
    And I don't see "Sign in"