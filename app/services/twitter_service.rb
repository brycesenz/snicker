class TwitterService
  def initialize
    @client = Twitter::Client.new(
      :consumer_key => "tW2RNcaD8JgL3ff4mVmA",
      :consumer_secret => "hWJnfFaciW7b2XgBKxY3JuI7qXxyRGEm9HkPvjplwU",
      :oauth_token => "702779286-seOCDVnVxHRjjYVZpXIvARasRTmwhvyZBbn5hByx",
      :oauth_token_secret => "nbPJM9KHeLrl9UoZVU1g2bJKeJ4bpRx9A3cujp9a0o"
    )
  end
  
  def search(text, count = 10)
   @client.search("#{text}", :count => count, :result_type => "recent").results.map do |status|
    "#{status.from_user}: #{status.text}"
    end
  end
end