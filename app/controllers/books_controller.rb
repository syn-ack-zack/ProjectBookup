require 'wikipediaScraper'
require 'openLibraryScraper'

class BooksController < ApplicationController
	def create
		user = Book.new(:isbn => params[:book][:isbn], :name => params[:book][:name], \
			:author => params[:book][:author], :genre => params[:book][:genre])
		redirect_to action: 'profile', controller: 'users'
	end
	def new
	end
	# Displays the book
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
