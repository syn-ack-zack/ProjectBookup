

class OpenLibraryScraper

	def returnBookCoverURL(isbn)
        url = "http://covers.openlibrary.org/b/isbn/"
        url += isbn.to_s + "-M.jpg"
        return url
    end

end


