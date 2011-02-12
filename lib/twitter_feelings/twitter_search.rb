# encoding: UTF-8

require 'yajl/http_stream'
require 'uri'

module TwitterFeelings

	class TwitterSearch

		def search(query)
			Yajl::HttpStream.get("http://search.twitter.com/search.json?q=#{URI.encode(query)}&rpp=30&locale=es&result_type=recent")					
		end

	end
	
end




