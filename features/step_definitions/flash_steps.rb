### FLEXIBLE STEPS ###
Then(/^I should (?:see no|not see the) flash$/) do
  page.should_not have_css("#flash-messages")
end

Then(/^I should see flash (.*?) "(.*?)"$/) do |key, message|
  page.should have_css("#flash-messages")
  page.should have_css(".alert-#{key}")
  page.should have_content(message)
end

Then(/^I should see an invalid data message$/) do
  steps %{
    Then I should see flash alert "There was a problem with some of your information."
  }
end

Then(/^I should see a third party error message$/) do
  steps %{
    Then I should see flash alert "We had a problem processing your data. Our team has been notified of this error, and are working to resolve it. We will contact you once it is fixed."
  }
end
