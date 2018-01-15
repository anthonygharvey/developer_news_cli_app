class DeveloperNewsCliApp::CodeBurstScrapper
	def get_page
		page = Nokogiri::HTML(open("https://codeburst.io/"))
	end

	def get_articles
		self.get_page.css(".js-trackedPost")
	end

# title = nil, author = nil, date = nil, read_time = nil, url = nil, website = nil, subtile = nil, trailing = nil

	def make_article
		self.get_articles.each do |article|
			a = DeveloperNewsCliApp::Article.new
			a.title = article.css("h3").text
			a.author = article.css(".postMetaInline-authorLockup a").text
			a.date = article.css("time").text
			a.url = article.css(".col a").attribute("href").value
			a.website = "CodeBurst"
			a.trailing = article.search(".u-fontSize18").text
		end
	end

end