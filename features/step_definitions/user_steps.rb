Given(/^I am a new anonymous user$/) do
  Capybara.current_session.driver.browser.clear_cookies
end

Given(/^I am a returning user$/) do
  headers = {}
  Rack::Utils.set_cookie_header!({}, 'stale', true)
  cookie_string = headers['Set-Cookie']

  Capybara.current_session.driver.browser.set_cookie(cookie_string)

  visit root_path # send the cookie [!]
end

Then(/^I should see the About page$/) do
  expect(page).to have_content(/Bienvenidos a Psychlopedia/)
end
