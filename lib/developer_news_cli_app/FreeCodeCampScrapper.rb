class DeveloperNewsCliApp::FreeCodeCampScrapper

	def get_page
		page = Nokogiri::HTML(open("https://medium.freecodecamp.org/"))
	end

	def get_articles
		self.get_page.css(".postArticle")
	end

	def make_article
		self.get_articles.each do |article|
			a = DeveloperNewsCliApp::Article.new
			a.title = article.css("h3").text
			a.author = article.css(".ds-link").text
			a.date = article.css("time").text
			a.read_time = article.css(".readingTime").attribute("title").value
			a.url = article.css(".postArticle-readMore a").attribute("href").value
			a.website = "FreeCodeCamp"
			a.subtitle = article.css("h4").value
			a.trailing = article.css("p").value
		end
	end




end