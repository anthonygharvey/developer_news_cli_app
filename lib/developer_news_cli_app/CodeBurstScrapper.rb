class DeveloperNewsCliApp::CodeBurstScrapper
	@@all = []

	def get_page
		Nokogiri::HTML(open("https://codeburst.io/"))
	end

	def get_articles
		self.get_page.css(".js-trackedPost")
	end

	def make_article
		self.get_articles.each do |article|
			a = DeveloperNewsCliApp::Article.new
			a.title = article.css("h3").text
			a.author = article.css(".postMetaInline-authorLockup a").text
			a.date = article.css("time").text
			a.url = article.css("a").attribute("href").value
			a.website = "CodeBurst"
			a.trailing = article.search(".u-fontSize18").text == "" ? nil : article.search(".u-fontSize18").text
			@@all << a
		end
	end
	
	def self.articles
		@@all
	end

	def self.article_count
		@@all.count
	end

end