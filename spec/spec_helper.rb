require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
#require 'factory_girl'
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

WebMock.disable_net_connect!(:allow_localhost => true)
#WebMock.allow_net_connect!

RSpec.configure do |config|
  # Mock Framework
  config.mock_with :rspec

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # *** IMPORTANT ***
  #----------------------------------------------------------------------------
  # Extend is for methods that act in groups, not in examples 
  # (e.g. calling a method before any it..end statement)
  # Include is for methods that act in examples
  # (e.g. inside of an it..end statement)

  # External helpers
  config.before(:all) do
  end

  config.before(:each) do
    webmock_twitter_success
#    webmock_twitter_error
  end
  
  config.after(:all) do
  end
end