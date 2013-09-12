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
end