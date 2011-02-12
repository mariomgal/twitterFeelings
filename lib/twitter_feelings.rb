# encoding: UTF-8

require 'twitter_feelings/twitter_search'
require 'twitter_feelings/stats_calculator'

module TwitterFeelings
	class TwitterFeelingsCalculator
		def initialize
			@twitter_search = TwitterSearch.new
			@stats_calculator = StatsCalculator.new
			@feeling_queries = {
				:love => "\"te+quiero+mucho\"+OR+\"te+quiero+más\"+OR+\"te+amo+tanto\"+OR+\"amo+tanto\"+OR+\"todo+mi+amor\"+OR+\"muy+enamorado\"+OR+\"tan+enamorada\"",
				:anger => "\"te+odio\"+OR+\"siento+rabia\"+OR+\"le+odio\"+OR+\"estoy+furioso\"+OR+\"estoy+furiosa\"+OR+\"crispado\"+OR+\"estoy+cabreado\"",
				:joy => "\"mas+feliz\"+OR+\"bastante+feliz\"+OR+\"tan+feliz\"+OR+\"muy+feliz\"+OR+\"gozo\"+OR+\"júbilo\"+OR+\"deleite\"+OR+\"alborozo\"+OR+\"juerga\"",
				:surprise => "\"no+me+lo+puedo+creer\"+OR+\"increible\"+OR+\"asombro\"+OR+\"me+ha+sorprendido\"+OR+\"te+ha+sorprendido\"+OR+\"cogido+por+sorpresa\"",
				:envy => "\"ambiciono\"+OR+\"codicio\"+OR+\"mucha+envidia\"+OR+\"yo+quiero+ser\"+OR+\"por+que+no+puedo\"+OR+\"envidio\"+OR+\"celoso\"",
				:sadness => "\"muy+triste\"+OR+\"tan+deprimido\"+OR+\"estoy+llorando\"+OR+\"tengo+el+corazón+roto\"+OR+\"estoy+triste\"\"+OR+\"me+quiero+morir\"",
				:fear => "\"muy+asustado\"+OR+\"tan+asustada\"+OR+\"realmente+asustado\"+OR+\"terrorifico\"+OR+\"tanto+temor\"+OR+\"que+horror\"+OR+\"aterrozizado\""				
			}			
		end
		
		def calculate_rates
			@feeling_rates = Hash.new
			@feeling_queries.each { |key, value| 
				puts key
				puts @stats_calculator.calculate_tweets_per_minute(@twitter_search.search_by_keyword(value))
				puts
			}	
		end
	
	end
end
