class DeveloperNewsCliApp::CLI
	
	def call
		get_articles
		list_articles
		menu
		goodbye
	end

	def get_articles
		DeveloperNewsCliApp::FreeCodeCampScrapper.new.make_article
		DeveloperNewsCliApp::HackerNoonScrapper.new.make_article
		DeveloperNewsCliApp::CodeBurstScrapper.new.make_article
		# binding.pry
	end
	
	def list_articles
		puts "Today's top developer articles:"
		puts ""
		display_summaries
		puts ""
	end

	def site_articles(site)
		case site
		when "FCC"
			puts "FCC articles 1 - 10!!!"
		when "HN"
			puts "HN articles 1 - 10!!!"
		when "CB"
			puts "CB articles 1 - 10!!!"
		when "BCS"
			puts "BCS articles 1 - 10!!1"
		end
		puts ""
		menu
	end

	def display_summaries
		puts "Free Code Camp (FCC)"
		DeveloperNewsCliApp::Article.display_top_three("FreeCodeCamp")
		puts "HackerNoon (HN)"
		DeveloperNewsCliApp::Article.display_top_three("HackerNoon")
		puts "CodeBurst (CB)"
		DeveloperNewsCliApp::Article.display_top_three("CodeBurst")
	end

	def list_site_articles
	end

	def menu
		input = nil
		while input != "EXIT"
			puts "Type the article number to see more info"
			puts "Or type the website abbreviation to see its 10 most recent articles"
			puts "Or type list to see the main list of articles"
			puts "Or type exit to end the program"
			input = gets.strip.upcase
			
			case input
			when "1"
				puts "Article 1..."
			when "2"
				puts "Article 2..."
			when "FCC", "HN", "CB", "BCS"
				site_articles(input)
			when "LIST"
				list_articles
			when "EXIT"
				goodbye
			else
				puts "not sure what you meant.  type list, an article number, site abbreviation or exit"
			end
			puts ""
		end
	end

	def goodbye
		puts "Thanks for using Developer News!"
		exit
	end

end