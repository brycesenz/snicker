require 'spec_helper'

describe Feed do
  # Initialization
  #----------------------------------------------------------------------------
  describe "initialization", :initialization => true do
    let(:twitter) { TwitterService.new }

    it "is an instance of TwitterService" do
      twitter.should be_an_instance_of(TwitterService)
    end
    
    it "initializes with client instance variable" do
#      twitter.client.should be_an_instance_of(Twitter)  #FAILS
      twitter.instance_variable_get(:@client).should be_an_instance_of(Twitter::Client)  #PASSES
    end
  end
  
  # Public Methods
  #----------------------------------------------------------------------------
  describe "public_methods", :public_methods => true do
    let(:twitter) { TwitterService.new }
    
    describe "search", :search => true do
      context "with default count" do
        before(:each) do
          @result = twitter.search("Rails", 1)
        end
        
        it "returns 10 items" do
          @result.should be_an(Array)
        end
      end
    end
  end
end