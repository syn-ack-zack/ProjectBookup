#Class openlibraryscraper

def returnBookCoverURL(isbn)
        url = "http://covers.openlibrary.org/b/isbn/"
        url += isbn.to_s + "-M.jpg"
    end


puts returnBookCoverURL 9788478888566


