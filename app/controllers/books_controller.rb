require 'wikipediaScraper'
require 'openLibraryScraper'

class BooksController < ApplicationController
	def create
	end
	
	def new
	end
	
	# Displays the book
	def show 
		@book = Book.find(params[:id])
		wiki = WikipediaScraper.new
		# Scrapes Wikipedia for book bio to populate the respective divs
		@bookDescription = wiki.scrapeUsingBookTitle(@book.name)
		@authorDescription = wiki.scrapeUsingAuthorName(@book.author)
	end
	
	def edit
	end 
	
	def update 
	end

	# handles searching for a book
	def search
		@query =  params[:user_search]
		if(@query == "")
			@book_results = nil
		else
			@book_results = Book.where("name LIKE ? OR author LIKE ?", "%#{@query}%","%#{@query}%")
			if(@book_results.length == 0)
				@book_results = nil
			end
		end
	end

	def like_book
	end
	
	def dislike_book
	end

end
