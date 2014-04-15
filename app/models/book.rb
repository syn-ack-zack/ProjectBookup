class Book < ActiveRecord::Base
  # Validation for name field in Book, should be present, unique, and minimum of one character
  validates :name, :presence => true, :uniqueness => true, length: {minimum: 1}

  # Validation for author field in Book, should be present and have a length between 1 and 35
  validates :author, :presence => true, length: {minimum: 1, maximum: 35}

  # Validation for isbn field in Book, should be present, unique, and 13 characters long
  validates :isbn, :presence => true, :uniqueness => true, length: {minimum: 13, maximum: 13}

  # Validation for the format of isbn. It should be 13 characters long, begin with 978 and can end in a digit or 'X'
  validates_format_of :isbn, :with => /\A^978\d{9}[X|0-9]$\Z/, :on => :create

  # Method to check that name and author aren't empty
  def has_name_and_author
    if self.name == ""
      return false
    elsif self.author == ""
      return false
    end
    return true
  end


  # Method takes in a book isbn and returns 1 if it is found, -1 if it isn't
  def already_exists(book_isbn)
    book = Book.find_by_isbn(book_isbn)
    if book
      return 1
    else
      return -1
    end
  end

end
