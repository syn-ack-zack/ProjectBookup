class BooksController < ApplicationController
	def create
	end
	def new
	end
	def show 
		@book = Book.find(params[:id])
	end
	def edit
	end 
	def update 
	end
end
