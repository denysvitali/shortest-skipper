require "./shortest-skipper/*"
require "http/client"
require "json"

module Shortest::Skipper
  class Skipper
    class Result
      JSON.mapping(
        destinationUrl: String,
        status: String
      )
    end

    def self.skip(url : String)
      uri = URI.parse(url)
      client = HTTP::Client.get uri
      sessid = client.cookies["PHPSESSID"].value
      matches = /sessionId: "(.*?)"/.match client.body
      sleep 5
      if !matches
        return ""
      end

      t = Time.new
      encodedUrl = URI.escape(url)
      uri = URI.parse("http://viid.me/shortest-url/end-adsession?adSessionId=#{matches[1]}&adbd=1&callback=reqwest_#{t.epoch}")
      client = HTTP::Client.get(uri, headers: HTTP::Headers{"Cookie" => "PHPSESSID=#{sessid}; referrer_url=#{encodedUrl}", "Referer" => url})
      matches = /reqwest_#{t.epoch}\((.*)\).*$/.match client.body
      if !matches
        return ""
      end

      Result.from_json matches[1]
    end
  end
end
