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
  end

  # Validations
  #----------------------------------------------------------------------------
  describe "validations", :validations => true do
    describe "search_text" do
      it { should validate_presence_of(:search_text) }
    end
  end
  
  # Public Methods
  #----------------------------------------------------------------------------
  describe "public_methods", :public_methods => true do
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
  end  
end