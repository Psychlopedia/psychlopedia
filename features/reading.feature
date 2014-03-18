Feature: reading experiences
  as a reader
  I want to be able to read experiences
  so I can learn from them

  Background:
    Given I am a returning user

  Scenario: read a random experience
    Given some experiences exist
    When I go to the home page
    Then I see one of the experiences
