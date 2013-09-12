require 'spec_helper'

describe Term do
  # Initialization
  #----------------------------------------------------------------------------
  describe "initialization", :initialization => true do
    let(:term) { Term.new }

    it "is an instance of Term" do
      term.should be_an_instance_of(Term)
    end
    
    it "initializes with empty results" do
      term.results.should be_empty
    end
    
    describe "initializing with params" do
      before(:each) do
        @term = Term.new(:results => ["a", "b"], :search_text => "Hello")
      end

      it "has results" do
        @term.results.should eq(["a", 'b'])
      end

      it "has search text" do
        @term.search_text.should eq("Hello")
      end
    end
  end

  # Validations
  #----------------------------------------------------------------------------
  describe "validations", :validations => true do
    describe "feed" do
      it { should validate_presence_of(:feed) }
    end

    describe "search_text" do
      it { should validate_presence_of(:search_text) }
    end
  end
  
  # Public Methods
  #----------------------------------------------------------------------------
  describe "public_methods", :public_methods => true do
    describe "publish", :publish => true do
      context "with invalid term" do
        let(:term) { Term.new }
        
        it "returns false" do
          term.publish.should be_false
        end

        it "adds errors to feed" do
          term.should have(1).errors_on(:feed)
        end

        it "adds errors to search_text" do
          term.should have(1).errors_on(:search_text)
        end
      end

      context "with valid term" do
        let(:feed) { Feed.new }
        let(:term) { Term.new(:feed => feed, :search_text => "Rails") }
        
        it "returns true" do
          term.publish.should be_true
        end
      end
    end
    
    describe "get_results", :get_results => true do
      let(:term) { Term.new }
      before(:each) do
        term.search_text = "testing"
      end

      context "with successful twitter request" do
        before(:each) do
          webmock_twitter_success
          term.get_results
        end
        
        it "populates results" do
          term.results.should_not be_empty
        end
      end

      context "with twitter error" do
        before(:each) do
#          webmock_twitter_success
#          @results = term.get_results
        end
      end
    end    

    describe "purge_results", :purge_results => true do
      let(:term) { Term.new }
      before(:each) do
        term.results = ["a", "b", "c"]
      end
      
      it "purges all results" do
        term.results.should_not be_empty
        term.purge_results
        term.results.should be_empty
      end
    end    
  end  
end