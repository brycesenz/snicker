class Term
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :feed, :search_text, :results
  validates :feed, :presence => true
  validates :search_text, :presence => true
  
  def initialize(attrs={})
    attrs.each do |k,v| send("#{k}=",v) end
    @results ||= []
  end

  def get_results
    results << TwitterService.new.search(@search_text, 5)
  end
  
  def purge_results
    results.clear
  end
  
  def publish
    return false unless valid?
    self.get_results
    feed.add_entry(self)
  end
  
  def persisted?
    false
  end
end