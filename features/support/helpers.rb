def expect_page_to_have_experience(experience)
  expect(page).to have_content(experience.title)
  expect(page).to have_content(experience.pseudonym)
  expect(page).to have_content(experience.body)
end
