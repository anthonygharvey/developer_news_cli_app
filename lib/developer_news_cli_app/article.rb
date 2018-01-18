class DeveloperNewsCliApp::Article
	attr_accessor :title, :author, :date, :read_time, :url, :website, :subtitle, :trailing

	@@all = []

	def initialize(title = nil, author = nil, date = nil, read_time = nil, url = nil, website = nil, subtile = nil, trailing = nil)
		@title = title
		@author = author
		@date = date
		@read_time = read_time
		@url = url
		@website = website
		@subtitle = subtile
		@trailing = trailing
		@@all << self
	end

	def self.all
		@@all
	end

	def self.current_articles
		@@current_articles
	end

	def self.clear_current_articles
		@@current_articles.clear
	end

	def self.add_to_current_artciles(articles)
		self.current_articles << articles
	end

	def self.print_titles
		self.all.each do |article|
			puts "#{article.title}"
		end
	end

	def self.website(website)
		self.all.collect do |article|
			if article.website == website
			end
		end
	end

	def self.display_top_three(website)
		self.website(website)[0..2].each.with_index(1) do |article, index|
			puts "  #{index}. #{article.title}"
		end
	end

	def self.display_articles(site)
		puts "#{site}:\n"
		self.website(site)[0..9].each.with_index(1) do |article, index|
			puts "  #{index}. #{article.title}"
		end
	end

end