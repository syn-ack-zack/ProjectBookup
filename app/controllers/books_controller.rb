require 'wikipediaScraper'
require 'openLibraryScraper'

class BooksController < ApplicationController
	def create
	end
	def new
	end
	# Displays the boko
	def show 
		@book = Book.find(params[:id])
		wiki = WikipediaScraper.new
		@bookDescription = wiki.scrapeUsingBookTitle(@book.name)
		@authorDescription = wiki.scrapeUsingAuthorName(@book.author)
	end
	def edit
	end 
	def update 
	end
end
