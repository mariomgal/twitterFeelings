require 'date'

module TwitterFeelings
	class StatsCalculator 
		def calculate_tweets_per_minute(search_result)
			first_tweet_time = timestamp_of(first_tweet_of(search_result))
			last_tweet_time = timestamp_of(last_tweet_of(search_result))
			puts 1000 * 60 * 30 / (last_tweet_time - first_tweet_time)			
		end
		
		def first_tweet_of(search_result)
			search_result['results'].last
			
		end
		
		def last_tweet_of(search_result)
			search_result['results'].first
		end
		
		def timestamp_of(tweet)
			date_string = tweet['created_at']
			DateTime.parse(date_string).to_time.to_i
		end
		
	end
end
