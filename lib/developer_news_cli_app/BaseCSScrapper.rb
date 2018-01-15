# Need to fix the author, date and trailing

class DeveloperNewsCliApp::BaseCSScrapper
	def get_page
		page = Nokogiri::HTML(open("https://medium.com/basecs"))
	end

	def get_articles
		self.get_page.css(".col.js-trackedPost")
	end

	def make_article
		self.get_articles.each do |article|
			# binding.pry
			a = DeveloperNewsCliApp::Article.new
			a.title = article.css("a")[0].text
			a.author = article.css(".postMetaInline-authorLockup a").text
			a.date = article.css("time").text
			a.url = article.css("a").attribute("href").value
			a.website = "BaseCS"
			# a.trailing = article.css("a")[2].text
		end
	end

end