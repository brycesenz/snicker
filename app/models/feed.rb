class Feed
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_reader :entries
  
  def initialize(*args)
    @entries = []
  end
  
  def title
    "All the worst things on Twitter"
  end
  
  def add_entry(entry)
    entries << entry
  end

  def new_term(*args)
    term_source.call(*args).tap do |term|
      term.feed = self
    end
  end
    
  def persisted?
    false
  end

  private
  def term_source
    @term_source ||= Term.public_method(:new)    
  end
end