gem 'nokogiri', '~>1.8.2'

require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative '../lib/developer_news_cli_app/cli'
require_relative '../lib/developer_news_cli_app/article'
require_relative '../lib/developer_news_cli_app/FreeCodeCampScrapper'
require_relative '../lib/developer_news_cli_app/HackerNoonScrapper'
require_relative '../lib/developer_news_cli_app/CodeBurstScrapper'
require_relative '../lib/developer_news_cli_app/AListApartScrapper'