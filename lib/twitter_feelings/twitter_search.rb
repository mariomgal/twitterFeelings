# encoding: UTF-8

require 'yajl/http_stream'
require 'uri'

module TwitterFeelings

	class TwitterSearch

		def search_by_keyword(keyword)
			Yajl::HttpStream.get("http://search.twitter.com/search.json?q=#{keyword}&rpp=30&locale=es&result_type=recent")					
		end

	end
	
end




