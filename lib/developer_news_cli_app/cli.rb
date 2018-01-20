class DeveloperNewsCliApp::CLI
	@@websites = ["FreeCodeCamp", "HackerNoon", "CodeBurst", "A List Apart"]
	@@current_article_count = 0
	@@current_website = ""
	@@current_articles = []

	def call
		welcome
		get_articles
		list_websites
		initial_instructions
		get_article_selection
	end
	
	def welcome
		puts "Welcome to the Developer News CLI App."
		puts "Scrapping the websties now..."
	end

	def get_articles
		DeveloperNewsCliApp::FreeCodeCampScrapper.new.make_article
		DeveloperNewsCliApp::HackerNoonScrapper.new.make_article
		DeveloperNewsCliApp::CodeBurstScrapper.new.make_article
		DeveloperNewsCliApp::AListApartScrapper.new.make_article
	end

	def list_websites
		puts ""
		self.websites.each.with_index(1){|website, index| puts"#{index}. #{website}"}
		puts ""
	end

	def initial_instructions
		puts "Please type the number of the website to see more of its articles"
		puts "Or type exit to end the program"
		get_website_input
	end

	def get_website_input
		input = nil
		input = gets.strip
		if input == "1"
			show_FreeCodeCampArticles
		elsif	input == "2"
			show_HackerNoonArticles
		elsif input == "3"
			show_CodeBurstArticles
		elsif input == "4"
			show_AListApartArticles
		elsif input == "exit"
			goodbye
		elsif input == "list"
			list_websites
			initial_instructions
		else
			puts "I'm not sure what you meant."
			list_websites
			initial_instructions
		end
	end

	def article_selection_instructions
		puts "\nType the number of an article to see more information about it."
		puts "Or type list or l to see a list of websites."
		puts "Or type exit to end the program."
		get_article_selection
	end

	def get_article_selection
		input = nil
		max_number = @@current_articles.count
		input = gets.strip
		if input.to_i <= max_number && input.to_i != 0
			print_summary(@@current_articles[input.to_i - 1])
		elsif input == "list" || "l"
			list_websites
			initial_instructions
		elsif	input.to_i > max_number
			puts "I'm not sure what you meant."
			article_selection_instructions
		elsif input =="exit"
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
		puts "\nType read or r to open the article in your browser."
		puts "Type back or b to go back to the list of #{@@current_website} articles."
		puts "Type list or l to see a list of websites."
		puts "Type exit to exit the program."

		input = gets.strip
		case input
		when "r", "read"
			open_url(article)
			print_summary(article)
		when "b", "back"
			if @@current_website == "FreeCodeCamp"
				show_FreeCodeCampArticles
				article_selection_instructions
			elsif @@current_website == "HackerNoon"
				show_HackerNoonArticles
				article_selection_instructions
			elsif @@current_website == "CodeBurst"
				show_CodeBurstArticles
				article_selection_instructions
			else
				show_AListApartArticles
				article_selection_instructions
			end
		when "list", "l"
			list_websites
			initial_instructions
			get_website_input
		when "exit"
			goodbye
		else
			puts "I'm not sure what you meant."
			get_article_summary_input(article)
		end
	end

	def show_FreeCodeCampArticles
		@@current_website = "FreeCodeCamp"
		update_current_article_count("FreeCodeCamp")
		@@current_articles = DeveloperNewsCliApp::FreeCodeCampScrapper.articles
		puts "\nFreeCodeCamp:\n"
		DeveloperNewsCliApp::FreeCodeCampScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
		article_selection_instructions
	end

	def show_HackerNoonArticles
		@@current_website = "HackerNoon"
		update_current_article_count("HackerNoon")
		@@current_articles = DeveloperNewsCliApp::HackerNoonScrapper.articles
		puts "\nHackerNoon:\n"
		DeveloperNewsCliApp::HackerNoonScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
		article_selection_instructions
	end

	def show_CodeBurstArticles
		@@current_website = "CodeBurst"
		update_current_article_count("CodeBurst")
		@@current_articles = DeveloperNewsCliApp::CodeBurstScrapper.articles
		puts "\nCodeBurst:\n"
		DeveloperNewsCliApp::CodeBurstScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
		article_selection_instructions
	end

	def show_AListApartArticles
		@@current_website = "AListApart"
		update_current_article_count("AListApart")
		@@current_articles = DeveloperNewsCliApp::AListApartScrapper.articles
		puts "\nA List Apart:\n"
		DeveloperNewsCliApp::AListApartScrapper.articles.each.with_index(1) do |article, index|
			puts "#{index}. #{article.title}"
		end
		article_selection_instructions
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

	def open_url(article)
		`open #{article.url}`
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
		when "AListApart"
			@@current_article_count = DeveloperNewsCliApp::AListApartScrapper.article_count
		end
	end

	def goodbye
		puts "Thanks for using Developer News!"
		exit
	end

end