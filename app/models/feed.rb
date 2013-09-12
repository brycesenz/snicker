class Feed
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_reader :entries
  
  def initialize
    @entries = []
  end
  
  def title
    "All the worst things on Twitter"
  end
  
  def new_term
    term_source.call.tap do |term|
      term.feed = self
    end
  end
  
  private
  def term_source
    @term_source ||= Term.public_method(:new)    
  end
end