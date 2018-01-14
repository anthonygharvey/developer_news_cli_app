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

### Info to display on full article
grab the author's name and info
maybe use Mechanize to click around on the webpage? (Medium clicks)

### CLI workflow

def DeveloperNewsCliApp::CLI.call
	developer_news::Scraper.new.make_articles
	list
end




### Scraper

def DeveloperNewsCliApp::Scrapper(page)
	Nokogiri::HTML(open(page))
end

def make_articles
	make_fcc_articles
	make_hn_articles
	make_cb_articles
	make_bcs_articles
end

def make_fcc_artcies
	s
end




