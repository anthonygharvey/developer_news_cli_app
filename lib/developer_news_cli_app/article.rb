class DeveloperNewsCliApp::Article
	# should have a name, author, date, read-time, url, intro
	# should belong to a website
	attr_accessor :name, :author, :date, :read_time, :url, :intro, :website

	@@all = []

	def initialize(name = nil, author = nil, date = nil, read_time = nil, url = nil, intro = nil, website = nil)
		@name = name
		@author = anuthor
		@date = date
		@read_time = read_time
		@url = url
		@intro = intro
		@website = website
		@@all << self
	end

end