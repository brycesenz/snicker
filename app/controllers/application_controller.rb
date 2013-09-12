class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html
  before_filter :initialize_feed
  
  private
  def initialize_feed
    # From Initializer
    @feed = MASTER_FEED
  end
end
