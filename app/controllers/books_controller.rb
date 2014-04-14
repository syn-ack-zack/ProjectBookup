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
		query_like = "%#{@query}%"
		
		# Searches the database for all books where the author or name contains text in the input query
		@book_results = Book.where("name LIKE ? OR author LIKE ? ", query_like, query_like)
	end
end
