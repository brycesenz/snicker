# Links
Then(/^I should see link "([^\"]*)"$/) do |link|
  page.should have_link(link)
end

# Buttons
Then(/^I should see button "([^\"]*)"$/) do |button|
  page.should have_button(button)
end
