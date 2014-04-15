class Book < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, length: {minimum: 1}
  validates :author, :presence => true, length: {minimum: 1, maximum: 35}
  validates :isbn, :presence => true, :uniqueness => true, length: {minimum: 13, maximum: 13}
  validates_format_of :isbn, :with => /\A^978\d{9}[X|0-9]$\Z/, :on => :create

  def has_name_and_author
    if self.name == ""
      return false
    elsif self.author == ""
      return false
    end
    return true
  end

  def already_exists(book_isbn)
    book = Book.find_by_isbn(book_isbn)
    if book
      return 1
    else
      return -1
    end
  end

end
