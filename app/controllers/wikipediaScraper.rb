require 'net/http'
require 'htmlentities'

# This class, using the wikipedia API, scrapes the first paragraph of
# a wikipedia article based on book title or author name
class WikipediaScraper

    # This method scrapes the first paragraph based on book title
    def scrapeUsingBookTitle(title)
        url = "http://en.wikipedia.org/w/api.php?"
        url +=URI.encode_www_form(:format => "xml",
            :action => "query",
            :titles => title,
            :prop => "revisions",
            :rvprop => "content"
            )
        uri = URI(url);
        rawXML = Net::HTTP.get(uri)
        #regex = /\{\{Infobox.*?\}\}(.*?)==/m
        regex = /\{\{Infobox.*?'''(.*?)==/m
        parseHTML(rawXML, regex)
    end

    # This method scrapes the first paragraph based on author name
    def scrapeUsingAuthorName(title)
        url = "http://en.wikipedia.org/w/api.php?"
        url +=URI.encode_www_form(:format => "xml",
            :action => "query",
            :titles => title,
            :prop => "revisions",
            :rvprop => "content"
            )
        uri = URI(url);
        rawXML = Net::HTTP.get(uri)
        regex = /\{\{Infobox.*?'''(.*?)==/m
        parseHTML(rawXML, regex)
    end


    # This method parses the results of a wikipedia API call and returns the first
    # paragraph of the article without wikipedia formatting
        def parseHTML(string, regex)
            string.match(regex) { |firstPara|
                firstPara = firstPara.captures[0]
                firstPara.gsub!(/\[\[[^\]]*?\|(.*?)\]\]/, '\1')
                firstPara.gsub!(/[\[\]']/, "")
                firstPara.gsub!(/\{\{.*?\}\}/, "")
                firstPara.gsub!(/&lt;\/?ref&gt.*?&lt;\/ref&gt;/, "")
                firstPara.gsub!(/(.*?\}\})/, '')
                firstPara = firstPara.force_encoding("iso-8859-1").encode("utf-8")
                firstPara.gsub!(/ref&gt.*?ref&gt;/, '')
                firstPara.gsub!(/\(.*?\)/, '')
                firstPara.gsub!(/&lt;ref.*?&gt;(&lt;\/ref&gt;)?/, '')
                encodedPara = HTMLEntities.new.decode firstPara

                return encodedPara
            }
            return "No data"
        end


end
