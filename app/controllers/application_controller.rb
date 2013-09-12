class ApplicationController < ActionController::Base
  protect_from_forgery
  
  THE_FEED = Feed.new
end
