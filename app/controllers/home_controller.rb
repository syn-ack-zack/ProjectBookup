class HomeController < ApplicationController
  def index
	@data = Book.all
  end
end
