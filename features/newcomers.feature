Feature: redirecting newcomers to the About page
  as an anonymous reader
  I want to be able to surpass my ignorance about the site
  and being redirected to light

  Scenario: access any page of the website
    Given I am a new anonymous user
    When I go to the home page
    Then I should see the About page

