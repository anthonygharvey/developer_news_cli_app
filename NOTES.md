### A command line interface for current articles on freeCodeCamp, HackerNoon, Codeburst and baseCS

 user types "developer-news"

shows a list of top 3 articles from each website

	freeCodeCamp (FCC)
		1. The unlikely history of the #100DaysOfCode Challenge, and why you should try it for 2018
		2. An Introduction to React Router v4 and its Philosophy Toward Routing
		3. Why we should convice our users to update their browsers - it's a win-win

	HackerNoon (HN)
		4. Will Robots Become Designers?  3 Tech Design Leaders Are Skeptical
		5. I'm harvesting credit card numbers and passwords from your site.  Here's how.
		6. Founder Interview: How Codacy Uses Codacy to Build Codacy.

	Codeburst (CB)
		7. Focus on scales - d3.js integration
		8. What Did I Learn in 2017?
		9. How Operating Sytems Work: 10 Concepts you Should Know as a developer

	baseCS (BCS)
		10. A Most Perfect Union: Just-In-Time Compilers
		11. A Deeper Inspection Into Compilation And Interpolation
		12. Leveling Up One's Parsing Game with ASTs

	Enter 1 - 12 to read an article
	puts "Or type the website abbreviation to see its 10 most recent articles
	puts "Or type list to see the main list of articles
	puts "Or type exit to end the program

	1
	Article 1 summary

	2
	Article 2 summary

	fcc
	displays the 10 most recent fcc articles

	hn
	displays the 10 most recent hn articles

	1
	displays article 1 summary from hn

	5
	displays article 5 summary from hn

	list
	displays the main list of top 3 articles from each website

	exit
	thanks the user for using the app and exits
___



check the terms of service for the websites
if they prohibit scraping, just email them and let them know I'm a Flatiron student and I'd like to scrape the website for a project and publish it to rubygems and that it is not for profit.


### CLI Workflow
def call
	get_articles
	start
end

def get_articles
	DeveloperNewsCliApp::FreeCodeCampScrapper.make_artciles
	DeveloperNewsCliApp::HackerNewsScrapper.make_artciles
	DeveloperNewsCliApp::CodeBurstScrapper.make_artciles
	DeveloperNewsCliApp::BaseCSScrapper.make_artciles
end



### Scraper workflow
def get_articles
end



### Scrapper workflow
def make_articles
	use Nokoguri to scrape article information from the homepage and create new articles from the Article class; which stores all of the articles in the @@all class variable
end