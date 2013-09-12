module WebmockHelper
  MOCKS_DIRECTORY = "#{Rails.root}/lib/test_helpers"

  #Note:  To get example responses, use Hurl.it  
  def webmock_twitter_success
    response = File.new "#{MOCKS_DIRECTORY}/twitter_response.json"
    stub_request(:get, /https:\/\/api.twitter.com\/1.1\/search\/tweets.json.*/).to_return(response)
  end

  def webmock_twitter_error
    response = File.new "#{MOCKS_DIRECTORY}/twitter_error.json"
    stub_request(:get, /https:\/\/api.twitter.com\/1.1\/search\/tweets.json.*/).to_return(response)
  end
end

RSpec.configure do |config|
  require 'webmock/rspec'
  config.include WebmockHelper
end

if respond_to?(:World)
  require 'webmock/cucumber'
  World(WebmockHelper)
end 