class DeveloperNewsCliApp::Article
	# should have a name, author, date, read-time, url, intro
	# should belong to a website
	attr_accessor :title, :author, :date, :read_time, :url, :intro, :website

	@@all = []

	def initialize(title = nil, author = nil, date = nil, read_time = nil, url = nil, website = nil)
		@title = title
		@author = author
		@date = date
		@read_time = read_time
		@url = url
		@website = website
		@@all << self
	end

	def self.all
		@@all
	end

end