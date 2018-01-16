class DeveloperNewsCliApp::FreeCodeCampScrapper
	@@all = []

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
			a.subtitle = article.css("h4").text
			a.trailing = article.css("p").text
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