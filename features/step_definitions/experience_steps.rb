When(/^I go to the home page$/) do
  visit root_path
end

Given(/^some experiences exist$/) do
  Experience.create title: 'An Experience', pseudonym: 'svankie', body: 'this is the real body'
  Experience.create title: 'Another Experience', pseudonym: 'parallax', body: 'this is the real body'
  Experience.create title: 'Yet Another Experience', pseudonym: 'ratatouille', body: 'this is the real body'
end

Then(/^I see one of the experiences$/) do
  experience = Experience.find_by_title(find('.title').text)
  expect_page_to_have_experience(experience)
end
