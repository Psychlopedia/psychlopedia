Feature: reading experiences
  as a reader
  I want to be able to read experiences
  so I can learn from them

  Background:
    Given I am a returning user
    Given some experiences exist

  Scenario: read a random experience
    When I go to the home page
    Then I see one of the experiences

  Scenario: see a list of all experiences
    When I go to the experiences list page
    Then I see all of the experiences
