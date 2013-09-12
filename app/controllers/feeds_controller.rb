class FeedsController < ApplicationController
  def index
    @feed = THE_FEED
    @terms = THE_FEED.entries
  end
  
  def new
    @feed = Feed.new
  end
=begin
  def home
    @feeds = Feed.all
    respond_with(@feeds)
  end
  
  def new
    @feed = Feed.new
    respond_with(@feed)
  end
=end
end
