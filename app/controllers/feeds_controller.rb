class FeedsController < ApplicationController
  def index
    if THE_FEED.entries.empty
      THE_FEED.add_entry
    end
    @feed = THE_FEED
    
    
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
