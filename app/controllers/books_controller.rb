require 'wikipediaScraper'
require 'openLibraryScraper'

class BooksController < ApplicationController

  #Create will run upon Book creation
	def create
    #Create a temporary book object containing the form input from the new book page
		book = Book.new(:isbn => params[:book][:isbn], :name => params[:book][:name], \
			:author => params[:book][:author], :genre => params[:book][:genre])

    #If book lacks a name or author, show an error and render the page again
    if !book.has_name_and_author
      flash[:notice] = "Book name and author required!"
      render 'books/new'
      flash[:notice] = ""
      return
    end

    #Get the result of the already_exists method...
    result = book.already_exists(book.isbn)

    #If the book is valid and it isn't found in the database, add it, then redirect to the profile page
    if result == -1 && book.valid?
      book.save
      redirect_to action: 'profile', controller: 'users'
    #If the book is found in the database, notify the user and render the page again
    elsif result == 1
      flash[:notice] = "Book already exists!"
      render 'books/new'
      flash[:notice] = ""
      return
    #Else, the book entered isn't valid. Notify the user and render the page again
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
     user = params["user"]
     book = params["book"]

     result = user + books

     respond_to do |format|
       format.json {render :jason => {:result => result}}
     end
	end
	
	def dislike_book
	end

end
