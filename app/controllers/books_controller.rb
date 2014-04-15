require 'wikipediaScraper'
require 'openLibraryScraper'

class BooksController < ApplicationController
	def create
		book = Book.new(:isbn => params[:book][:isbn], :name => params[:book][:name], \
			:author => params[:book][:author], :genre => params[:book][:genre])

    if !book.has_name_and_author
      flash[:notice] = "Book name and author required!"
      render 'books/new'
      flash[:notice] = ""
      return
    end

    result = book.already_exists(book.isbn, book.author)

    if result == -1 && book.valid?
      book.save
      redirect_to action: 'profile', controller: 'users'
    elsif result == 1
      flash[:notice] = "Book already exists!"
      render 'books/new'
      flash[:notice] = ""
      return
    else
      flash[:notice] = "Book is not valid! Book ISBN-13, Name, and Author required!"
      render 'books/new'
      flash[:notice] = ""
      return
    end

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
