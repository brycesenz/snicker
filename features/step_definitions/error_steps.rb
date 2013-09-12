### FLEXIBLE STEPS ###
Then(/^I should see no errors$/) do
  page.should_not have_css(".error")
end

Then(/^I should see error "([^\"]*)"$/) do |error|
  page.should have_css("small.error")
  page.should have_content(error)
end

Then(/^I should see error "([^\"]*)" (?:on|on field) "([^\"]*)"$/) do |error, field|
  page.should have_css("small.error.#{field.gsub(' ', '_')}", text: "#{error}")
end