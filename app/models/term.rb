class Term
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_writer :feed, :search_text
  attr_reader :feed, :results, :search_text
  validates :search_text, :presence => true
  
  def initialize(*args)
    @search_text = nil
    @feed = nil
    @results = []
  end
  
  def get_results
    @results = TwitterService.new.search(@search_text, 5)
  end
end