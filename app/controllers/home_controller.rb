class HomeController < ApplicationController
  def index
	@second_book = Book.new
	@second_book.isbn = ""
	@second_book.name = "Harry Potter"
	@second_book.author = nil
	@second_book.save

	@data = Book.all
  end
end
