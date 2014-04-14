class Book < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, length: {minimum: 2}
  validates :author, :presence => true, length: {minimum: 2, maximum: 35}

  def has_name_and_author
    if self.name == ""
      return false
    elsif self.author == ""
      return false
    end
    return true
  end

  def already_exists(name_or_isbn, book_author)
    book = Book.find_by_name(name_or_isbn)
    if !book
      book = Book.find_by_isbn(name_or_isbn)
    end
    if book
      if book.author == book_author
        return 1
      else
        return 0
      end
    else
      return -1
    end
  end

end
