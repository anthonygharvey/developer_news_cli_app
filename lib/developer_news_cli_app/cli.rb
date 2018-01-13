class DeveloperNewsCliApp::CLI
	
	def call
		list_articles
		menu
		goodbye
	end
	
	def list_articles
		puts "Today's top developer articles:"
		puts ""
		puts <<-DOC
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
		DOC
		puts ""
	end

	def site_articles(site)
		# binding.pry
		case site
		when "FCC"
			puts "FCC articles 1 - 10!!!"
		when "HN"
			puts "HN articles 1 - 10!!!"
		when "CB"
			puts "CB articles 1 - 10!!!"
		when "BCS"
			puts "BCS articles 1 - 10!!1"
		end
		puts ""
		menu
	end

	def list_site_articles
	end

	def menu
		input = nil
		while input != "EXIT"
			puts "Type the article number to see more info"
			puts "Or type the website abbreviation to see its 10 most recent articles"
			puts "Or type list to see the main list of articles"
			puts "Or type exit to end the program"
			input = gets.strip.upcase
			
			case input
			when "1"
				puts "Article 1..."
			when "2"
				puts "Article 2..."
			when "FCC", "HN", "CB", "BCS"
				site_articles(input)
			when "LIST"
				list_articles
			when "EXIT"
				goodbye
			else
				puts "not sure what you meant.  type list, an article number, site abbreviation or exit"
			end
			puts ""
		end
	end

	def goodbye
		puts "Thanks for using Developer News!"
		exit
	end

end