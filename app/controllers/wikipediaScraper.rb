require 'net/http'
require 'htmlentities'

class WikipediaScraper

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
                encodedPara = HTMLEntities.new.decode firstPara
                firstPara.gsub!(/(ref&gt.*?ref&gt;)/, '')
                return encodedPara
            }
            return "No data"
        end


end