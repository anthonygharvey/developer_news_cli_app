class DeveloperNewsCliApp::HackerNoonScrapper
	@@all = []

	def get_page
		page = Nokogiri::HTML(open("https://hackernoon.com/"))
	end

	def get_articles
		self.get_page.css(".js-trackedPost")
	end

	def make_article
		self.get_articles.each do |article|
			a = DeveloperNewsCliApp::Article.new
			a.title = article.css("h3").text
			a.author = article.css(".ds-link").text
			a.date = article.css("time").text
			a.url = article.css("a").attribute("href").value
			a.website = "HackerNoon"
			a.trailing = article.css(".u-fontSize18").text
			@@all << a
		end
	end

	def self.articles
		@@all
	end

end