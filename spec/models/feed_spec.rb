require 'spec_helper'

describe Feed do
  # Initialization
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
  
  # Attributes
  #----------------------------------------------------------------------------
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
    
    describe "add_entry" do
      let(:entry) { feed.add_entry }
      
      it "is an instance of Term" do
        entry.should be_an_instance_of(Term)
      end

      it "has our feed as its feed" do
        entry.feed.should eq(feed)
      end
    end
  end
end