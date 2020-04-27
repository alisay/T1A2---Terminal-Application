require "coronapp/version"
require "open-uri"
require "json"

module Coronapp
  class Error < StandardError; end
  
  class Stat
    def get_stat(given_stat)
      # begin 
      stat_hash = {new: "new_daily_cases", deaths: "new_daily_deaths", total: "total_cases", recovered:"total_recoveries",toll: "total_deaths"}
      return stat_hash[given_stat]
    end

    def cache(result, country)
      return File.write("./cache/#{country}.json", result)
    end 
  end  
  
  def self.get(options = {})
      country = options.fetch(:country).upcase
      date = options.fetch(:date).strftime("%-m/%-d/%y")
      stat = options.fetch(:stat).downcase.to_sym
      url = "https://api.thevirustracker.com/free-api?countryTimeline=#{country}"
      s = Stat.new
      result = URI.open(url).read
      s.cache(result, country)
      return "#{JSON.parse(File.read("./cache/#{country}.json")).dig("timelineitems",0, date, s.get_stat(stat))} #{s.get_stat(stat).gsub("_", " ")}"
  end
end

