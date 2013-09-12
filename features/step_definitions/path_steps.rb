Given(/^I am on the (.*?) page$/) do |path|
  visit send("#{path}_path")
end

Then(/^I should be on the (.*?) page$/) do |path|
  current_path.should == send("#{path}_path")
end

Then(/^my url should have "(.*?)" with value "(.*?)"$/) do |token, value|
  uri = URI.parse(current_url)
  "#{uri.path}?#{uri.query}".should == current_path(:reset_password_token => value)
end

