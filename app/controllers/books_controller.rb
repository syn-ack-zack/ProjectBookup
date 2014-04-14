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
	def search
		@query =  params[:user_search]
		if(@query == "")
			@book_results = nil
		else
			@book_results = Book.where("name LIKE ?", "%#{@query}%")
			if(@book_results.length == 0)
				@book_results = nil
			end
		end
	end
end
