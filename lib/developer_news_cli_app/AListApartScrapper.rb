class DeveloperNewsCliApp::AListApartScrapper
	@@all = []

	def get_page
		Nokogiri::HTML(open("https://alistapart.com/articles"))
	end

	def get_articles
		self.get_page.css(".entry-list")
	end

	def make_article
		self.get_articles.each do |article|
			a = DeveloperNewsCliApp::Article.new
			a.title = article.css(".entry-title a").text
			a.author = article.css(".author").text
			a.date = article.css("time").text
			a.trailing = article.css("p")[1].text
			a.url = "https://alistapart.com" + article.css(".entry-title a").attribute("href").value
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