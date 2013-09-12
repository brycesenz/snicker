require 'spec_helper'

describe Feed do
  # Model & Factory Validation
  #----------------------------------------------------------------------------
  describe "initialization", :initialization => true do
    let(:feed) { Feed.new }

    it "is an instance of Feed" do
      feed.should be_an_instance_of(Feed)
    end
    
    it "initializes with empty entries" do
      feed.entries.should be_empty
    end
  end
  
  describe "attributes", :attributes => true do
    let(:feed) { Feed.new }
    
    describe "title" do
      it "has correct title" do
        feed.title.should eq("All the worst things on Twitter")
      end
      
      it "cannot assign new title" do
        expect { feed.title = "New Title" }.to raise_error
      end
    end
    
    describe "new_term" do
      let(:term) { feed.new_term }
      
      it "is an instance of Term" do
        term.should be_an_instance_of(Term)
      end

      it "has feed as its feed" do
        term.feed.should eq(feed)
      end
    end
  end
end