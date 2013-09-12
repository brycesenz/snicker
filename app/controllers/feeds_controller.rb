class FeedsController < ApplicationController
  def index
    if THE_FEED.entries.empty?
      entry = THE_FEED.add_entry
      entry.search_text = "Redskins"
      entry.get_results
    end
    @feed = THE_FEED
    puts "Entries = #{@feed.entries.inspect}"    
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
