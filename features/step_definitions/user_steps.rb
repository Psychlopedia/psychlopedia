Given(/^I am a new anonymous user$/) do
  # Set cookie to `nil`.
end

Then(/^I should see the About page$/) do
  expect(page).to have_content(/Bienvenidos a Psychlopedia/)
end
