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
    
    describe "new_term" do
      context "without args*" do
        let(:term) { feed.new_term }
        
        it "is an instance of Term" do
          term.should be_an_instance_of(Term)
        end
  
        it "has our feed as its feed" do
          term.feed.should eq(feed)
        end
      end
      
      context "with args* (tightly coupled)", :bad => true do
        let(:term) { feed.new_term(:search_text => "Rails") }
        
        it "is an instance of Term" do
          term.should be_an_instance_of(Term)
        end
  
        it "has our feed as its feed" do
          term.feed.should eq(feed)
        end        

        it "has 'Rails' as its search text" do
          term.search_text.should eq("Rails")
        end        
      end
    end

    describe "add_entry" do
      let(:feed) { Feed.new }
      let(:term) { Term.new }
      
      before(:each) do
        feed.add_entry(term)
      end
      
      it "adds term to feed's entries array" do
        feed.entries.should include(term)
      end
    end
  end
end