class DeveloperNewsCliApp::Article
	# should have a name, author, date, read-time, url, intro
	# should belong to a website
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

	def self.print_titles
		self.all.each do |article|
			puts "#{article.title}"
		end
	end

	def self.website(website)
		articles = []
		self.all.each do |article|
			if article.website == website
				# puts "#{article.title} - #{article.website}"
				articles << article
			end
		end
		articles
	end

	def self.display_top_three(website)
		self.website(website)[0..2].each.with_index(1) do |article, index|
			puts "  #{index}. #{article.title}"
		end
	end

end