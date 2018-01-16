# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application - I created a CLI that presents the user with an initial list of websites to view their recent articles.  Once the user selects a website a list of its recent articles is shown and the user is presented with options to either select a particular article to view more information about it, go back to the list of websites, or exit the program.  If the user selects an article, they are shown more details about the article and given an option to read the article, which will open their browser to the article, go back to the list of website articles, go back to the list of websites, or exit the program.

- [x] Pull data from an external source - I used Nokoguri to scrape the homepages of FreeCodeCamp, HackerNoon and Codeburst for article information.

- [x] Implement both list and detail views - The CLI allows the user to see a list of websites and is able to drill-down to a list of current articles for their chosen website and to further drill-down to see specific details about a chosen article.
