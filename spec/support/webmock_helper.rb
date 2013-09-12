module WebmockHelper
  MOCKS_DIRECTORY = "#{Rails.root}/lib/credda/test_helpers/webmock"

  #Note:  To get example responses, use Hurl.it  
  def webmock_geocoder
    response = File.new "#{MOCKS_DIRECTORY}/geocoder/geocoder_success.json"
    stub_request(:get, /http:\/\/maps.googleapis.com\/maps\/api\/geocode\/json.*/).to_return(response)
  end
end

RSpec.configure do |config|
  require 'webmock/rspec'
  config.include WebmockHelper
end

#if respond_to?(:World)
#  require 'webmock/cucumber'
#  World(WebmockHelper)
#end 