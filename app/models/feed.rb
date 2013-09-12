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
  
  def add_entry
    entry_source.call.tap do |entry|
      entry.feed = self
    end
  end
    
  private
  def entry_source
    @entry_source ||= Term.public_method(:new)    
  end
end