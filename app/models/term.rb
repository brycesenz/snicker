class Term
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_writer :feed
  attr_reader :feed, :results

  def initialize
    @feed = nil
    @results = []
  end  
end