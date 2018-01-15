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
	
	def display_summaries
		DeveloperNewsCliApp::Article.clear_current_articles
		puts "Free Code Camp (FCC)"
		DeveloperNewsCliApp::Article.add_to_current_artciles(DeveloperNewsCliApp::Article.display_top_three("FreeCodeCamp"))
		puts "HackerNoon (HN)"
		DeveloperNewsCliApp::Article.add_to_current_artciles(DeveloperNewsCliApp::Article.display_top_three("HackerNoon"))
		puts "CodeBurst (CB)"
		DeveloperNewsCliApp::Article.add_to_current_artciles(DeveloperNewsCliApp::Article.display_top_three("CodeBurst"))
	end

	def site_articles(site)
		case site
		when "FCC"
			DeveloperNewsCliApp::Article.display_articles("FreeCodeCamp")
		when "HN"
			DeveloperNewsCliApp::Article.display_articles("HackerNoon")
		when "CB"
			DeveloperNewsCliApp::Article.display_articles("CodeBurst")
		end
		puts ""
		menu
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
			when "FCC", "HN", "CB"
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