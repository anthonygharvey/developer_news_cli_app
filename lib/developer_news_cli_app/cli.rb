class DeveloperNewsCliApp::CLI
	@@websites = ["FreeCodeCamp", "HackerNoon", "CodeBurst"]
	# @@FreeCodeCampArticles = []
	@@current_article_count = 0
	@@current_website = ""
	@@current_articles = []

	def call
		welcome
		get_articles
		list_websites
		initial_instructions
		get_website_input
		get_article_selection
		# binding.pry
		# `open #{DeveloperNewsCliApp::FreeCodeCampScrapper.articles[-1].url}`
		# list_articles
		# menu
		# goodbye
	end
	
	def welcome
		puts "Welcome to the Developer News CLI App."
		puts "Scrapping the websties now..."
	end

	def websites
		@@websites
	end

	def current_article_count
		@@current_article_count
	end

	def update_current_article_count(website)
		case website
		when "FreeCodeCamp"
			@@current_article_count = DeveloperNewsCliApp::FreeCodeCampScrapper.article_count
		when "HackerNoon"
			@@current_article_count = DeveloperNewsCliApp::HackerNoonScrapper.article_count
		when "CodeBurst"
			@@current_article_count = DeveloperNewsCliApp::CodeBurstScrapper.article_count
		end
	end

	def list_websites
		self.websites.each.with_index(1){|website, index| puts"#{index}. #{website}"}
	end

	def initial_instructions
		puts "Please type the number of the website to see more of its articles"
		puts "Or type exit to end the program"
	end

	def get_website_input
		input = nil
		while input != "exit"
			input = gets.strip
			# binding.pry
			case input
			when "1"
				@@current_website = "FreeCodeCamp"
				show_FreeCodeCampArticles
				article_selection_instructions
				update_current_article_count("FreeCodeCamp")
				@@current_articles = DeveloperNewsCliApp::FreeCodeCampScrapper.articles
				get_article_selection
				# binding.pry
			when "2"
				@@current_website = "HackerNoon"
				show_HackerNoonArticles
				article_selection_instructions
				update_current_article_count("HackerNoon")
				@@current_articles = DeveloperNewsCliApp::HackerNoonScrapper.articles
				get_article_selection
			when "3"
				@@current_website = "CodeBurst"
				show_CodeBurstArticles
				article_selection_instructions
				update_current_article_count("CodeBurst")
				@@current_articles = DeveloperNewsCliApp::CodeBurstScrapper.articles
				get_article_selection
			when "exit"
				goodbye
			end
		end
	end

	def article_selection_instructions
		puts "\nType the number of an article to see more information about it."
		puts "Or type list to see a list of websites."
		puts "Or type exit to end the program."
	end

	def get_article_selection
		input = nil
		max_number = @@current_articles.count
		input = gets.strip.to_i
		if input <= max_number
			print_summary(@@current_articles[input.to_i - 1])
		elsif input == 0
			goodbye
		else
			get_article_selection
		end
	end

	def print_summary(article)
		puts "---------- #{@@current_website} ----------"
		puts "Title: #{article.title}"
		if	article.subtitle != nil
			puts "Subtitle: #{article.subtitle}"
		end
		if article.trailing != nil
			puts "Trailing: #{article.trailing}"
		end
		puts "Author: #{article.author}"
		if article.date != nil
			puts "Date: #{article.date}"
		end
		if article.read_time != nil
			puts "Read Time: #{article.read_time}"
		end
		get_article_summary_input(article)
	end

	def get_article_summary_input(article)
		puts "Type read or r to open the article in your browser.\n
		Type back to go back to the list of #{@@current_website} articles.\n
		Type list to see a list of websites.\n
		Type exit to exit the program."

		input = gets.strip
		case input
		when "r"
			puts "REDING THE ARTILE!"
			goodbye
		when "back"
			if @@current_website == "FreeCodeCamp"
				show_FreeCodeCampArticles
				initial_instructions
			elsif @@current_website == "HackerNoon"
				show_HackerNoonArticles
				initial_instructions
			else
				show_CodeBurstArticles
				initial_instructions
			end
		when "list"
			list_websites
			initial_instructions
		when "exit"
			goodbye
		else
			puts "I'm not sure what you meant."
			get_article_summary_input(article)
		end
	end

	def show_FreeCodeCampArticles
		puts "\nFreeCodeCamp:\n"
		DeveloperNewsCliApp::FreeCodeCampScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
	end

	def show_HackerNoonArticles
		puts "\nHackerNoon:\n"
		DeveloperNewsCliApp::HackerNoonScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
	end

	def show_CodeBurstArticles
		puts "\nCodeBurst:\n"
		DeveloperNewsCliApp::CodeBurstScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
	end

	def get_articles
		DeveloperNewsCliApp::FreeCodeCampScrapper.new.make_article
		DeveloperNewsCliApp::HackerNoonScrapper.new.make_article
		DeveloperNewsCliApp::CodeBurstScrapper.new.make_article
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